package icia.project.gabom;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class RestSnsTimeLineController {

	@GetMapping(value = "/sns/timeline", produces = "application/json;charset=UTF-8")
	public String snsTimeLine() {
		System.out.println("타임라인 들어옴");
		
		
		
		
		
		return null;
	}
	
	
	
}
