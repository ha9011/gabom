package icia.project.gabom.service;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import icia.project.gabom.dao.SnsPostEditDao;
import icia.project.gabom.dto.Snsposts;

@Service
public class SnsPostEdit {
	
	@Autowired
	SnsPostEditDao snsPostEditDao;
	
	public String edit(String editContents, int postNumber, Principal principal) {
		Snsposts snsPost= new Snsposts();
		snsPost.setSns_posts_number(postNumber).setSns_posts_content(editContents);
		JsonObject jsonOb= new JsonObject();
		Snsposts beforeContent=snsPostEditDao.beforeContnets(snsPost);
		jsonOb.addProperty("beforeContent", beforeContent.getSns_posts_content());
		int result=snsPostEditDao.editPost(snsPost);
		if(result!=0) {
			jsonOb.addProperty("message", "수정 되었습니다");
			Snsposts resultContent=snsPostEditDao.getContent(snsPost);
			jsonOb.addProperty("editContent", resultContent.getSns_posts_content());
		}else {
			jsonOb.addProperty("message", "수정 오류");
		}
		return new Gson().toJson(jsonOb);
	}
	
	
	
}
