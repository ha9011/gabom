package icia.project.gabom;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class TripController {
	
	@RequestMapping(value = "/trip", method = RequestMethod.GET)
	public String trip() {
		System.out.println("여행계획");
		
		return "Trip/Tripplan";
	}
	

}
