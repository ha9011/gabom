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
		System.out.println("서비스 내 이메일"+member_email);
		boolean seachResult=searchUserEmailDao.searchUserEmail(member_email);
		System.out.println("dao후에 리졸트"+seachResult);
		HashMap<String,String> sucessMessage= new HashMap<String, String>();
		if(seachResult==true) {
				sucessMessage.put("message", " ");
		}else if(seachResult==false) {
				sucessMessage.put("message", "입력하신 이메일이 존재 하지 않습니다.");
		}
		return sucessMessage;
	}


}
