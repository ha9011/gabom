package icia.project.gabom;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import icia.project.gabom.service.SnsFriendCancel;

@RestController
public class SnsFriendCancelController {

	@Autowired
	SnsFriendCancel snsFriendCancel;
	
	
	@PostMapping(value = "/sns/friend/cancel", produces="text/plain;charset=utf-8")
	public String friendCancel(@RequestParam("friendId") String friendId
		,Principal principal) {
		
		System.out.println("친구 삭제 들어옴");
		System.out.println(friendId);
		System.out.println(principal.getName());
		String json=snsFriendCancel.cancel(friendId,principal);
		
		return json;
	}
	
	
}
