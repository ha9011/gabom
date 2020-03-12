package icia.project.gabom;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import icia.project.gabom.service.SnsHate;

@RestController
public class RestSnsHateController {

	@Autowired
	SnsHate snsHate;
	
	
	
		@PostMapping(value = "sns/timeline/hate", produces = "application/json;charset=UTF-8")
		public String snsHate(Principal principal,@RequestParam("postNumber") int postNumber) {
			System.out.println("싫어요 아이디"+principal.getName());
			System.out.println("누른 게시글 번호"+postNumber);
			String json=snsHate.Hate(principal,postNumber);
			return json;
		}
	
	
}
