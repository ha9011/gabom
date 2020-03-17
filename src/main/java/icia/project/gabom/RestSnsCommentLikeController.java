package icia.project.gabom;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import icia.project.gabom.service.SnsCommentLike;

@RestController
public class RestSnsCommentLikeController {
	
	@Autowired
	SnsCommentLike commentLike;
	
	@PostMapping(value = "sns/comment/like", produces = "application/json;charset=UTF-8")
	public String CommentLike(@RequestParam("commentNumber") int commentNumber,
			Principal principal) {
		String json=commentLike.like(commentNumber,principal);
		
		return json;
		
	}
}
