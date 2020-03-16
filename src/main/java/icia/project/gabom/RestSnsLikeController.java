package icia.project.gabom;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import icia.project.gabom.service.SnsLike;

@RestController
public class RestSnsLikeController {

	@Autowired
	SnsLike snsLike;
	
	@PostMapping(value = "sns/timeline/like", produces = "application/json;charset=UTF-8")
	public String snsLike(Principal principal,@RequestParam("postNumber") int postNumber) {
		
		
		String json=snsLike.like(principal,postNumber);
		
		return json;
	}
	
	
	
}
