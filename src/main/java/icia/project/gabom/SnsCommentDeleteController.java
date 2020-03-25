package icia.project.gabom;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import icia.project.gabom.service.SnsCommentDelete;

@RestController
public class SnsCommentDeleteController {

	@Autowired
	SnsCommentDelete snsCommentDelete;
	
	@PostMapping(value = "/sns/comment/delete", produces="text/plain;charset=utf-8")
	public String commentDelete(@RequestParam("commentNum") int CommentNum
			,@RequestParam("postNum") int postNum) {
		String json=snsCommentDelete.delete(CommentNum,postNum);
		return json;
	}
	
}
