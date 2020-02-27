package icia.project.gabom;

import java.security.Principal;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class LoginController {

	// 인증이 안됐다면
	// 겟매핑 로그인
	@PreAuthorize("isAnonymous()")
	@GetMapping(value = "/login")
	public String login(Principal principal) {
		
			return "login/login"; // 디렉토리//jsp
		
	}

}
