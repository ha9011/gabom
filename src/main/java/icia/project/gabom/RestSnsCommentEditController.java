package icia.project.gabom;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import icia.project.gabom.service.SnsCommentEdit;

@RestController
public class RestSnsCommentEditController {
	
	@Autowired
	SnsCommentEdit snsCommentEdit;
	
	
	@PostMapping(value = "/sns/comment/edit", produces="text/plain;charset=utf-8")
	public String commentEdit(@RequestParam("data") String data,
			@RequestParam("commentNumber")int num) {
		String json=snsCommentEdit.edit(data,num);
		return json;
	}
	
}
