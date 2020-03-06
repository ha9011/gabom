package icia.project.gabom.service;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import icia.project.gabom.dao.GetProfileDao;
import icia.project.gabom.dto.Member;
@Service
public class SnsProfile {

	
	@Autowired
	GetProfileDao getProfileDao;
	
	public String getProfile(Principal principal) {
		Member member=new Member();
		member.setMember_id(principal.getName());
		member=getProfileDao.getProfile(member);
		Gson gson= new Gson();
		JsonObject memberObject = new JsonObject();
		memberObject.addProperty("member_name", member.getMember_name());
		memberObject.addProperty("member_profile_picture", member.getMember_profile_picture());
		String json=gson.toJson(memberObject);
		System.out.println("json"+json);
		return json;
	}

}
