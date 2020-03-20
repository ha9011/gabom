package icia.project.gabom.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import icia.project.gabom.dao.SnsCommentEditDao;
import icia.project.gabom.dto.SnsCommentDto;

@Service
public class SnsCommentEdit {

	@Autowired
	SnsCommentEditDao snsComentEditDao;
	
	
	public String edit(String data, int num) {
		SnsCommentDto setComment=new SnsCommentDto();
		setComment.setCommentNumber(num).setContent(data);
		snsComentEditDao.edit(setComment);
		JsonObject result=new JsonObject();
		result.addProperty("content", setComment.getContent());
		return new Gson().toJson(result);
	}

}
