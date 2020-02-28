package icia.project.gabom.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import icia.project.gabom.dao.MatchDataDao;
import icia.project.gabom.dto.Member;

@Service
public class MatchData {

	@Autowired
	MatchDataDao matchDataDao; 
	
	public HashMap<String, String> matchdata(Member member) {
		HashMap<String,String> sucessMessage= new HashMap<String, String>();
		boolean seachResult = matchDataDao.matchData(member);
				if(seachResult==true) {
					sucessMessage.put("message", " ");
			}else if(seachResult==false) {
					sucessMessage.put("message", "입력하신 정보가 일치하지 않습니다.");
			}
			return sucessMessage;
	}

}
