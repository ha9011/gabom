package icia.project.gabom;

import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;

import icia.project.gabom.dao.IServiceDao;
import icia.project.gabom.dto.Qnaboard;



@RestController
public class RestServiceCenter {
	@Autowired
	private IServiceDao sDao;
	
	//qna 글작성
	@PostMapping(value = "/qnawrite", produces = "text/plain;charset=UTF-8")
	public String qnawrite(@RequestParam("title") String title, 
						   @RequestParam("content")String content,
						   Principal principal) {
		boolean result = sDao.getqnawrite(title, content, principal.getName());

		List<Qnaboard> nlist = sDao.getQnaList(); // 전체qna 정보 출력
		SimpleDateFormat format1= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		for(Qnaboard qna : nlist) {
			String wDate=format1.format(qna.getQna_date());
			qna.setResultDate(wDate);
		}

		String json = new Gson().toJson(nlist);

		return json;
	}
}
