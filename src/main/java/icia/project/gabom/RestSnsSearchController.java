package icia.project.gabom;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import icia.project.gabom.service.SnsSearch;

@RestController
public class RestSnsSearchController {

	@Autowired
	SnsSearch snsSearch;
	
	@PostMapping(value = "sns/search", produces = "application/json;charset=UTF-8")
	public String search(@RequestParam("searchData") String data,Principal principal) {
		
		System.out.println("검색들어옴");
		System.out.println(data);
		String json=snsSearch.search(data,principal);
		return json;
	}
	
	
	
}
