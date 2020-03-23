package icia.project.gabom.service;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.client.HttpServerErrorException.GatewayTimeout;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import icia.project.gabom.dao.SnsHateDao;
import icia.project.gabom.dao.SnsLikeDao;
import icia.project.gabom.dto.SnsLikeHateCounter;

@Service
public class SnsHate {

	@Autowired
	SnsHateDao snsHateDao;
	@Autowired
	SnsLikeDao snsLikeDao;
	@Transactional
	public String hate(Principal principal, int postNumber) {
		SnsLikeHateCounter snsHate = new SnsLikeHateCounter();
		snsHate.setMemberId(principal.getName()).setPostNumber(postNumber);
		SnsLikeHateCounter snsHateInsert = new SnsLikeHateCounter();
		snsHateInsert = snsHateDao.likeCheck(snsHate);
		if (snsHateInsert == null) {
					snsHateDao.hateInsert(snsHate);
		}else if (snsHateInsert.getSnsLike()==1&&snsHateInsert.getSnsHate()==0) {
			snsHateDao.likeCancel(snsHate);
		} 
		else if(snsHateInsert.getSnsHate()==0) {
			snsHateDao.upDate(snsHate);
		} else if(snsHateInsert.getSnsHate()==1){
			snsHateDao.delete(snsHate);
		}
		int hateTotal=snsHateDao.total(postNumber);
		int likeTotal = snsLikeDao.total(postNumber);
		JsonObject	totalObject= new JsonObject();
		totalObject.addProperty("hateTotal", hateTotal);
		totalObject.addProperty("likeTotal", likeTotal);
		return new Gson().toJson(totalObject);
	}// hateEnd

}
