package icia.project.gabom;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;



@Controller
public class LoginController {
	
	
	@PreAuthorize("isAnonymous()")
	@GetMapping(value = "/login")
	public String login() {
		return "login/login";
	}
	
	
}
