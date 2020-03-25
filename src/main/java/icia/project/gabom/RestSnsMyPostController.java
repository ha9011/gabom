package icia.project.gabom;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import icia.project.gabom.service.SnsMyPost;

@RestController
public class RestSnsMyPostController {

	@Autowired
	SnsMyPost snsMyPost;
	
	
	
	@PostMapping(value = "sns/mypost", produces = "application/json;charset=UTF-8")
	public String myPost(@RequestParam("row") int row,Principal principal) {
		String json=snsMyPost.myPost(row,principal);
		return json;
	}
	
	
}
