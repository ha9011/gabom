package icia.project.gabom.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import icia.project.gabom.dao.SnsFriendListDao;
import icia.project.gabom.dto.Member;

@Service
public class SnsFriendList {

	@Autowired
	SnsFriendListDao snsFriendListDao;
	
	public String get(String id) {
		List<Member> result=snsFriendListDao.get(id);
		if(result.size()==0) {
			JsonObject resultObj= new JsonObject();
			resultObj.addProperty("message", "친구가 없습니다.");
			return new Gson().toJson(resultObj);
		}
		return new Gson().toJson(result);
	}

}
