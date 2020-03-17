package icia.project.gabom;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import icia.project.gabom.service.SnsPostDelete;

@RestController
public class RestPostDeleteController {
	
	@Autowired
	SnsPostDelete snsPostDelete;
	
	
	@PostMapping(value = "sns/post/delete",produces = "application/json;charset=utf-8")
	public String snsPostDelete(@RequestParam("postNumber") int postNumber
			,Principal principal) {
		
		String json=snsPostDelete.delete(postNumber,principal);
		
				return json;
	}
	
	
}
