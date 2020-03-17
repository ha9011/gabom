package icia.project.gabom.service;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import icia.project.gabom.dao.CommentLikeDao;
import icia.project.gabom.dao.SnsCommentHateDao;
import icia.project.gabom.dto.SnsLikeHateCounter;


@Service
public class SnsCommentLike {

	@Autowired
	CommentLikeDao commentLikeDao;
	@Autowired
	SnsCommentHateDao commentHateDao;
	public String like(int commentNumber, Principal principal) {
		
		SnsLikeHateCounter commentLike= new SnsLikeHateCounter();
		commentLike.setCommentNumber(commentNumber).setMemberId(principal.getName());
		SnsLikeHateCounter commentLikeCheck= new SnsLikeHateCounter();
		commentLikeCheck=commentLikeDao.check(commentLike);
		if(commentLikeCheck==null) {
			commentLikeDao.like(commentLike);
		}else if(commentLikeCheck.getSnsHate()==1&&commentLikeCheck.getSnsLike()==0) {
			commentLikeDao.hateCancel(commentLike);
		}else if(commentLikeCheck.getSnsLike()==0) {
			commentLikeDao.likeUpdate(commentLike);
		}else if(commentLikeCheck.getSnsLike() == 1) {
			commentLikeDao.likeCancel(commentLike);
		}
		int likeTotal=commentLikeDao.total(commentNumber);
		int hateTotal=commentHateDao.total(commentNumber);
		JsonObject likeTotalObject= new JsonObject();
		likeTotalObject.addProperty("commentLikeTotal", likeTotal);
		likeTotalObject.addProperty("commentHateTotal", hateTotal);
		
		return new Gson().toJson(likeTotalObject);
	}

}
