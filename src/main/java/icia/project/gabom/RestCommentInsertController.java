package icia.project.gabom;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import icia.project.gabom.service.SnsCommentInsert;

@RestController
public class RestCommentInsertController {

	@Autowired
	SnsCommentInsert snsCommentInsert;
	
	
	@PostMapping(value = "/sns/comment/insert", produces="text/plain;charset=utf-8")
	public String commentInsert(@RequestParam("postNumber") int postNumber,
			@RequestParam("commentContent") String commentContent,Principal principal) {
		System.out.println("들어옴");
		System.out.println(postNumber);
		System.out.println(commentContent);
		String json=snsCommentInsert.insert(postNumber,commentContent,principal);
		return json;
	}
	
}
