package icia.project.gabom.service;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import icia.project.gabom.dao.SnsFriendRequestDao;
import icia.project.gabom.dto.Member;

@Service
public class SnsFriendRequest {

	@Autowired
	SnsFriendRequestDao snsFriendRequestDao;
	
	
	@Transactional
	public String request(String friendId, Principal principal) {
		JsonObject result=null;
		int checkResult=snsFriendRequestDao.check(friendId,principal.getName());
		if(checkResult==1) {
			result=new JsonObject();
			result.addProperty("message", "이미 요청 하셨습니다.");
		}else {
			snsFriendRequestDao.insert(friendId,principal.getName());
			result=new JsonObject();
			result.addProperty("message", "요청이 완료 되었습니다.");
		}
		return new Gson().toJson(result);
	}


	public String cancel(String friendId, Principal principal) {
		JsonObject result=null;
		int checkResult=snsFriendRequestDao.cancel(friendId,principal.getName());
		if(checkResult==0) {
			result=new JsonObject();
			result.addProperty("message", "이미 요청 하셨습니다.");
		}else {
			result=new JsonObject();
			result.addProperty("message", "요청이 완료 되었습니다.");
		}
		return new Gson().toJson(result);
	}

	
	public String sum(String id) {
		List<Member> memberList=snsFriendRequestDao.sum(id);
		if(memberList.size()==0) {
			JsonObject result=new JsonObject();
			result.addProperty("message", "요청이 없습니다.");
			return new Gson().toJson(result);
		}
		return new Gson().toJson(memberList);
	}

}
