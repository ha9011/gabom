package icia.project.gabom.service;

import java.io.File;
import java.io.IOException;
import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;

import icia.project.gabom.dao.IsnstimelineDao;
import icia.project.gabom.dao.SnsWriteInsertDao;
import icia.project.gabom.dto.Snsposts;

@Service
public class SnsWriteInsert {

	@Autowired
	SnsWriteInsertDao snsWriteInsertDao;
	@Autowired
	SnsTimeLineService snsTimeLineService;

	// 글 등록 서비스
	// 글 내용이 없으면 없는채로 작성되게 작업해야됌
	@Transactional
	public String snsWriteInsert(List<MultipartFile> file, Principal principal, String snsWriteContents,
			String security, HttpServletRequest req, int low) {
		String json = null; // 리턴할 json
		String root_path = req.getSession().getServletContext().getRealPath("/"); // 상대경로
		String sysRoot_path=root_path.substring(0, root_path.indexOf("g")+1);
		System.out.println(sysRoot_path);
		String real=sysRoot_path+"\\gabom\\src\\main\\webapp\\resources\\snsPostsImage\\";
		String attach_path = "resources/snsPostsImage/"; // 파일 경로
		File dir = new File(real); // 디렉토리가 없을경우 만든다.
		String id = principal.getName(); // 시큐리티 아이디 정보
		System.out.println("아이디" + id);
		System.out.println("글 내용" + snsWriteContents);
		int photoResult = 0;
		if (!dir.isDirectory()) { // upload폴더 없다면
			dir.mkdir(); // upload폴더 생성
		}
		int securityNumber = 0; // 공개 설정이 전체 공개라면
		if (security.equals("전체 공개")) {
			securityNumber = 0;
		} else if (security.equals("나만 보기")) { // 나만보기
			securityNumber = 2;
		} else if (security.equals("친구 공개")) { // 친구공개
			securityNumber = 1;
		}

		Snsposts snsPostsWrite = new Snsposts(); // 글 DB에 INSERT
		snsPostsWrite.setSns_posts_writer(id).setSns_posts_content(snsWriteContents)
				.setSns_posts_authority(securityNumber); // DTO로 SET
		int writeResult = snsWriteInsertDao.snsWriteInsert(snsPostsWrite); // DB에 INSERT SELECT KEY로 글번호를 가져온다.
		int postsNumber = snsPostsWrite.getSns_posts_number(); // 글번호
		for (int i = 0; i < file.size(); i++) {
			if (file.get(i).isEmpty() == false) { // 파일이 있으면 false 없으면 TRUE
				Snsposts snsPhotoPosts = new Snsposts(); // 게시글 사진
				snsPhotoPosts.setSns_photo_origin_name(System.currentTimeMillis() + file.get(i).getOriginalFilename());
				// 실제 DB와 경로에 저장될 사진 파일
				snsPhotoPosts.setSns_photo_system_name(file.get(i).getOriginalFilename());
				// 유저에게 보여줄 파일 이름
				snsPhotoPosts.setSns_posts_number(postsNumber);
				// 사진 DB에 들어갈 글번호
				File files = new File( // 경로에 파일 저장
						real+ System.currentTimeMillis() + file.get(i).getOriginalFilename());
				try {
					file.get(i).transferTo(files);// 변환해서 저장한다
					if (writeResult != 0) {// 사진있는 글INSERT가 성공할 경우
						photoResult = snsWriteInsertDao.snsPhotoInsert(snsPhotoPosts);// 사진테이블에 사진 INSERT
					}
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		if (writeResult != 0 || photoResult != 0) { // 사진이 없는 파일일 경우 글등록이 성공하면
			json=snsTimeLineService.snsTimeLine(principal,low);	
			
		}
		return json;
	}

}
