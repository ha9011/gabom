package icia.project.gabom.service;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import icia.project.gabom.dao.SnsHateDao;
import icia.project.gabom.dao.SnsLikeDao;
import icia.project.gabom.dto.SnsLikeHateCounter;

@Service
public class SnsLike {

	@Autowired
	SnsLikeDao snsLikeDao;
	@Autowired
	SnsHateDao snsHateDao;
	@Transactional
	public String like(Principal principal, int postNumber) {
		String json = null;
		SnsLikeHateCounter snsLike = new SnsLikeHateCounter();
		snsLike.setMemberId(principal.getName()).setPostNumber(postNumber);
		SnsLikeHateCounter snsLikeCheck = new SnsLikeHateCounter();
		snsLikeCheck = snsLikeDao.check(snsLike);
		if (snsLikeCheck == null) {
			snsLikeDao.like(snsLike);
		} else if (snsLikeCheck.getSnsHate() == 1 && snsLikeCheck.getSnsLike() == 0) {
			snsLikeDao.hateCancel(snsLike);
		} else if (snsLikeCheck.getSnsLike() == 0) {
			snsLikeDao.likeUpdate(snsLike);
		} else if (snsLikeCheck.getSnsLike() == 1) {
			snsLikeDao.likeCancel(snsLike);
		}

		int likeTotal = snsLikeDao.total(postNumber);
		int hateTotal = snsHateDao.total(postNumber);
		JsonObject totalObject = new JsonObject();
		totalObject.addProperty("likeTotal", likeTotal);
		totalObject.addProperty("hateTotal", hateTotal);
		json = new Gson().toJson(totalObject);
		return json;
	}

}
