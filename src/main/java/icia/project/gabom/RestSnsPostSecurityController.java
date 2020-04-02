package icia.project.gabom;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import icia.project.gabom.service.SnsPostSecurity;

@RestController
public class RestSnsPostSecurityController {
	
	@Autowired
	SnsPostSecurity snsPostSecurity;
	
	@PostMapping(value = "/sns/post/security",produces = "application/json;charset=utf-8")
	public String snsPostSecurity(@RequestParam("postNumber") int postNumber,
			@RequestParam("securityVal") int securityVal) {
		
		String json=snsPostSecurity.edit(postNumber,securityVal);
		
		return json;
	}
}
