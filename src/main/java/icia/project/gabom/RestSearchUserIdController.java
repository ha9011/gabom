package icia.project.gabom;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import icia.project.gabom.dto.Member;
import icia.project.gabom.service.SearchUserEmail;

@RestController
public class RestSearchUserIdController {
	
	
	@Autowired
	SearchUserEmail searchUserEmail;
	
	//이메일 존재 여부 확인
	@PostMapping(value ="/user/id/email", produces = "application/json;charset=UTF-8")
	public HashMap<String,String> SearchUserId(Member member) {
		HashMap<String,String> sucessMessage=searchUserEmail.searchUserEmail(member.getMember_email());
		return sucessMessage;
	}
	
}
