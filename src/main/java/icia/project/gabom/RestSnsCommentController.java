package icia.project.gabom;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import icia.project.gabom.service.SnsComment;

@RestController
public class RestSnsCommentController {

	@Autowired
	SnsComment snsComment;
	
	
	@PostMapping(value = "sns/comment", produces = "application/json;charset=UTF-8")
	public String snsComment(@RequestParam("postNumber") int postNumber) {
		System.out.println("댓글 들어옴");
		System.out.println(postNumber);
		String json=snsComment.snsComment(postNumber);
		return json;
	}
	
	
}
