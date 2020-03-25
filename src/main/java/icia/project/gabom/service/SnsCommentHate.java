package icia.project.gabom.service;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import icia.project.gabom.dao.CommentLikeDao;
import icia.project.gabom.dao.SnsCommentHateDao;
import icia.project.gabom.dto.SnsLikeHateCounter;

@Service
public class SnsCommentHate {
	@Autowired
	SnsCommentHateDao snsCommentHateDao;
	@Autowired
	CommentLikeDao commentLikeDao;
	
	
	@Transactional
	public String Hate(int commentNumber, Principal principal) {
		SnsLikeHateCounter commentHate= new SnsLikeHateCounter();
		commentHate.setCommentNumber(commentNumber).setMemberId(principal.getName());
		SnsLikeHateCounter commentHateCheck= new SnsLikeHateCounter();
		commentHateCheck=snsCommentHateDao.check(commentHate);
		if(commentHateCheck==null) {
			snsCommentHateDao.hate(commentHate);
		}else if(commentHateCheck.getSnsHate()==0&&commentHateCheck.getSnsLike()==1) {
			snsCommentHateDao.likeCancel(commentHate);
		}else if(commentHateCheck.getSnsHate()==0) {
			snsCommentHateDao.hateUpdate(commentHate);
		}else if(commentHateCheck.getSnsHate() == 1) {
			snsCommentHateDao.hateCancel(commentHate);
		}
		int hateTotal=snsCommentHateDao.total(commentNumber);
		int likeTotal=commentLikeDao.total(commentNumber);
		JsonObject hateTotalObject= new JsonObject();
		hateTotalObject.addProperty("hateTotal", hateTotal);
		hateTotalObject.addProperty("likeTotal", likeTotal);
		return new Gson().toJson(hateTotalObject);
	}

}
