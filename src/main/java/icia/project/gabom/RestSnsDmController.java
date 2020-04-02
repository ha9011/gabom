package icia.project.gabom;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import icia.project.gabom.service.SnsDm;

@RestController
public class RestSnsDmController {
	
	@Autowired
	SnsDm snsDm;
	
	
	@PostMapping(value ="/sns/dm" ,produces = "application/json;charset=UTF-8")
	public String snsDm(Principal principal) {
		System.out.println(principal.getName());
		String json=snsDm.dm(principal.getName());
		return json;
	}
	
	
}
