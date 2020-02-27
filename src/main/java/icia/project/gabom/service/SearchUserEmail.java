package icia.project.gabom.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import icia.project.gabom.dao.SearchUserEmailDao;

@Service
public class SearchUserEmail {
			
	@Autowired
	SearchUserEmailDao searchUserEmailDao;
	
	
	public HashMap<String,String> searchUserEmail(String member_email){
		boolean seachResult=searchUserEmailDao.searchUserEmail(member_email);
		HashMap<String,String> sucessMessage= new HashMap<String, String>();
		if(seachResult==true) {
				sucessMessage.put("message", " ");
		}else if(seachResult==false) {
				sucessMessage.put("message", "입력하신 이메일이 존재 하지 않습니다.");
		}
		return sucessMessage;
	}


}
