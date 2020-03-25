package icia.project.gabom.service;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import icia.project.gabom.dao.SnsFriendCancelDao;
import icia.project.gabom.dto.SnsFriendStatus;

@Service
public class SnsFriendCancel {
	
	@Autowired
	SnsFriendCancelDao snsFriendCancelDao;
	
	@Transactional
	public String cancel(String friendId, Principal principal) {
		
		SnsFriendStatus status= new SnsFriendStatus();
		status.setMyId(principal.getName()).setFriendId(friendId);
		boolean result=snsFriendCancelDao.cancel(status);
		JsonObject resultOb=new JsonObject();
		if(result) {
			snsFriendCancelDao.cancel2(status);
			resultOb.addProperty("message", "정상적으로 처리 되었습니다.");
		}
		
		return new Gson().toJson(resultOb);
	}
	
	
	
	
}
