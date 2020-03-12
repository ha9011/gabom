package icia.project.gabom;

import java.security.Principal;
import java.util.List;

import javax.mail.Multipart;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import icia.project.gabom.service.SnsWriteInsert;

@RestController
public class RestSnsWriteInsertController {

	@Autowired
	SnsWriteInsert snsWriteInsert;
	
	
	@PostMapping(value = "/sns/write/insert",produces = "application/json;charset=UTF-8")
	public String snsWriteInsert(@RequestParam("snsWriteImage") List<MultipartFile> file,Principal principal,
								@RequestParam("sns_posts_content") String snsWriteContents,
								@RequestParam("security") String security,
								HttpServletRequest req) {
					
		String json=snsWriteInsert.snsWriteInsert(file,principal,snsWriteContents,security,req);
		
		
		return json;
	}
	
}
