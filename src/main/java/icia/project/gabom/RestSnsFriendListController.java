package icia.project.gabom;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import icia.project.gabom.service.SnsFriendList;

@RestController
public class RestSnsFriendListController {

	@Autowired
	SnsFriendList snsFriendList;
	
	@PostMapping(value = "sns/friend/list", produces = "application/json;charset=UTF-8")
	public String friendList(@RequestParam("id") String id) {
		String json=snsFriendList.get(id);
		
		
		return json;
	}
	
}
