package icia.project.gabom;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import icia.project.gabom.service.SnsDm;

@RestController
public class RestSnsDmController {
	
	@Autowired
	SnsDm snsDm;
	
	
	@PostMapping(value ="/sns/dm" ,produces = "application/json;charset=UTF-8")
	public String snsDm(Principal principal) {
		String json=snsDm.dm(principal.getName());
		return json;
	}
	
	@PostMapping(value ="/detail/contents",produces = "application/json;charset=UTF-8")
	public String snsDmDetailContents(@RequestParam("userId") String userId,Principal principal) {
		String json=snsDm.dmdetail(userId,principal.getName());
		return json;
	}
	
	@PostMapping(value ="/insert/contents",produces = "application/json;charset=UTF-8")
	public String snsInsertContents(@RequestParam("contents") String contents
			,Principal principal,@RequestParam("userId") String userId) {
		
		String json=snsDm.dmInsert(contents,principal.getName(),userId);
		return json;
	}
	@PostMapping(value ="/delete/contents",produces = "application/json;charset=UTF-8")
	public String snsDeleteContents(@RequestParam("num") int num,
			@RequestParam("id") String id,@RequestParam("userId") String userId) {
		String json=snsDm.dmDelete(num,id,userId);
		return json;
	}
	
}
