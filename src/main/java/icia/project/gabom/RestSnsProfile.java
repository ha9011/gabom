package icia.project.gabom;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import icia.project.gabom.service.SnsProfile;

@RestController
public class RestSnsProfile {

	@Autowired
	SnsProfile snsProfile;

	@GetMapping(value = "/sns/profile", produces = "application/json;charset=UTF-8")
	public String snsProfile(Principal principal) {
		String json = snsProfile.getProfile(principal);
		return json;
	}

}
