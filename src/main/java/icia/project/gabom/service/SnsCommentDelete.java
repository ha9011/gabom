package icia.project.gabom.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import icia.project.gabom.dao.SnsCommentDeleteDao;

@Service
public class SnsCommentDelete {

	@Autowired
	SnsCommentDeleteDao commentDel;
	
	public String delete(int num, int postNum) {
		boolean result=commentDel.delete(num);
		JsonObject jsonResult= new JsonObject();
		if(result) {
			jsonResult.addProperty("message", "성공");
		}else {
			jsonResult.addProperty("message", "실패");
		}
		return new Gson().toJson(jsonResult);
	}
		
	
	
}
