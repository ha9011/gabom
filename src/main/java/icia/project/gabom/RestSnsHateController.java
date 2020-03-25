package icia.project.gabom;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import icia.project.gabom.service.SnsHate;

@RestController
public class RestSnsHateController {

	@Autowired
	SnsHate snsHate;
	
		@PostMapping(value = "sns/timeline/hate", produces = "application/json;charset=UTF-8")
		public String snsHate(Principal principal,@RequestParam("postNumber") int postNumber) {
			String json=snsHate.hate(principal,postNumber);
			return json;
		}
	
	
}
