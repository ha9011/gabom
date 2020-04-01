package icia.project.gabom;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;

import icia.project.gabom.dao.IServiceDao;
import icia.project.gabom.dto.Serviceqna;



@RestController
public class RestServiceCenter {
	@Autowired
	private IServiceDao sDao;
	
	@PostMapping(value = "/qnawrite", produces = "text/plain;charset=UTF-8")
	public String qnawrite(@RequestParam("title") String title, @RequestParam("content") String content) {
		System.out.println("레스트컨트룰러 qna작성모달");
		System.out.println("qna작성 제목 : " + title);
		System.out.println("qna작성 내용 : " + content);
		boolean result = sDao.getqnawrite(title, content);
		System.out.println("글작성 성공?" + result);

		List<Serviceqna> nlist = sDao.getqnalist(); // 전체공지 정보 출력
		System.out.println("noticeslist=" + nlist);

		String json = new Gson().toJson(nlist);
		System.out.println(json);

		return null;
	}
}
