package icia.project.gabom;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import icia.project.gabom.service.SnsTimeLineProfileBox;


@RestController
public class SnsTimeLineProfileController {
	@Autowired
	SnsTimeLineProfileBox snsTimeLineProfile; 
	
	@PostMapping(value = "/sns/timeline/profile", produces = "application/json;charset=UTF-8")
	public String timeLineProFile(@RequestParam("id") String id) {
		
		String json=snsTimeLineProfile.profile(id);
		return json;
	}
	
	
}
