package icia.project.gabom;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import icia.project.gabom.service.SnsCommentHate;

@RestController
public class RestSnsCommentHateController {
	@Autowired
	SnsCommentHate snsCommentHate;
	
	
	@PostMapping(value = "sns/comment/hate", produces = "application/json;charset=UTF-8")
	public String commentHate(@RequestParam("commentNumber") int commentNumber,
			Principal principal) {
			String json=snsCommentHate.Hate(commentNumber,principal);
				return json;
	}
}
