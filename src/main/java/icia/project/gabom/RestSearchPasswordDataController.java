package icia.project.gabom;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import icia.project.gabom.dto.Member;
import icia.project.gabom.service.MatchData;

@RestController
public class RestSearchPasswordDataController {
	
	@Autowired
	MatchData matchData;
	
	@PostMapping(value ="/user/password/data", produces = "application/json;charset=UTF-8")
	public HashMap<String,String> searchPasswordData(Member member){
		HashMap<String,String> sucessMessage = matchData.matchdata(member);
		return sucessMessage;
	}
	
}
