package icia.project.gabom;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DumiIdController {

	
	
	
	
	@RequestMapping(value = "/dumi")
	public String dumi() {
		return "dumiIdCraete";
	}
	
}
