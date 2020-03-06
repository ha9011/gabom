package icia.project.gabom;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class SnsMainController {

	
	@PreAuthorize("isAuthenticated()")
	@GetMapping(value = "/snsmain")
	public String snsMain() {
		return "sns/snsMain";
	}
}
