package icia.project.gabom.service;

import java.io.File;
import java.io.IOException;
import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class SnsWriteInsert {

	public void snsWriteInsert(List<MultipartFile> file, Principal principal, String snsWriteContents,
			String security, HttpServletRequest req) {
			
		
		
			String root_path=req.getSession().getServletContext().getRealPath("/");
			System.out.println(root_path);
			String attach_path="resources/snsPostsImage/";
			File dir=new File(root_path+attach_path);
			if(!dir.isDirectory()){  //upload폴더 없다면
				dir.mkdir();  //upload폴더 생성
			}
			for(int i = 0 ; i<file.size();i++) {
				String filename=file.get(i).getOriginalFilename();
				File files=new File(root_path+attach_path+System.currentTimeMillis()+filename);
				System.out.println(files);
				try {
					file.get(i).transferTo(files);
					System.out.println("업로드 성공했다잉");
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		
	}

}
