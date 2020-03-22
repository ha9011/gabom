package icia.project.gabom;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import icia.project.gabom.service.SnsFriendRequest;

@RestController
public class SnsFriendRequestController {
	
	
	@Autowired
	SnsFriendRequest snsFriendRequest;
	
	
	@PostMapping(value = "/sns/friend/request", produces="text/plain;charset=utf-8")
	public String friendRequest(@RequestParam("friendId") String friendId
			,Principal principal) {
		String json=snsFriendRequest.request(friendId,principal);
		return json;
	}
	@PostMapping(value = "/sns/friend/request/cancel", produces="text/plain;charset=utf-8")
	public String friendRequestCancel(@RequestParam("friendId") String friendId
			,Principal principal) {
		String json=snsFriendRequest.cancel(friendId,principal);
		return json;
	}
	@PostMapping(value = "/sns/friend/request/sum", produces="text/plain;charset=utf-8")
	public String friendRequestSum(@RequestParam("id") String id) {
		String json=snsFriendRequest.sum(id);
		return json;
	}
	
}
