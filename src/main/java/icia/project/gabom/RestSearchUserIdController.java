package icia.project.gabom;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class RestSearchUserIdController {

	//이메일 존재 여부 확인
	@PostMapping(value ="/user/id/email", produces = "application/json;charset=UTF-8")
	public String SearchUserId() {
		System.out.println("들어옴");
		
		return "asd";
	}
	
}
