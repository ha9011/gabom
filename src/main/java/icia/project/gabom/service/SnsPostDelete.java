package icia.project.gabom.service;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import icia.project.gabom.dao.SnsPostDeleteDao;

@Service
public class SnsPostDelete {
	
	@Autowired
	SnsPostDeleteDao postdel;
	
	@Transactional
	public String delete(int postNumber, Principal principal) {
		boolean result=postdel.commentServiceDel(postNumber);
		result=postdel.commentDel(postNumber);
		result= postdel.postServiceDel(postNumber);
		result= postdel.postPhotoDel(postNumber);
		result= postdel.postDel(postNumber);
		JsonObject resultOb= new JsonObject();
		if(result) {
			resultOb.addProperty("message", "삭제 되었습니다.");
		}else {
			resultOb.addProperty("message", "삭제 오류");
		}
		return new Gson().toJson(resultOb);
	}
	
	
	
}
