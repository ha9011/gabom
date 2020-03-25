package icia.project.gabom;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import icia.project.gabom.service.SnsMyPost;
import icia.project.gabom.service.SnsUserPosts;

@RestController
public class RestSnsUserPostController {

	@Autowired
	SnsUserPosts snsUserPosts;
	@Autowired
	SnsMyPost snsMyPost;

	@PostMapping(value = "sns/user/posts", produces = "application/json;charset=UTF-8")
	public String userPost(@RequestParam("id") String id, @RequestParam("row") int row, Principal principal) {
		String json = null;
		if (principal.getName().equals(id)) {
			json = snsMyPost.myPost(row, principal);
		} else {
			json = snsUserPosts.userPosts(row,id,principal);
		}
		return json;
	}

}
