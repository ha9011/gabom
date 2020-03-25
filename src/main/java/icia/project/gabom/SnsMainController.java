package icia.project.gabom;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import icia.project.gabom.dto.House;

@Controller
public class SnsMainController {
	
	@PreAuthorize("isAuthenticated()")
	@GetMapping(value = "/snsmain")
	public String snsMain() {
		return "sns/snsMain";
	}

}
