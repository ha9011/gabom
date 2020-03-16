package icia.project.gabom.service;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
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

	public String hate(Principal principal, int postNumber) {
		String json = null;
		SnsLikeHateCounter snsHate = new SnsLikeHateCounter();
		snsHate.setMemberId(principal.getName()).setPostNumber(postNumber);
		SnsLikeHateCounter snsHateInsert = new SnsLikeHateCounter();
		snsHateInsert = snsHateDao.likeCheck(snsHate);
		if (snsHateInsert == null) {
			//boolean insertResult=
					snsHateDao.hateInsert(snsHate);
			//if(insertResult) {
			//	return json=snsTimeLine.snsTimeLine(principal);
			//}
		}else if (snsHateInsert.getSnsLike()==1&&snsHateInsert.getSnsHate()==0) {
			//boolean cancelResult =
			snsHateDao.likeCancel(snsHate);
			//if(cancelResult) {
				//return json=snsTimeLine.snsTimeLine(principal);
		//	}
		} 
		else if(snsHateInsert.getSnsHate()==0) {
			snsHateDao.upDate(snsHate);
			//return json=snsTimeLine.snsTimeLine(principal);
		} else if(snsHateInsert.getSnsHate()==1){
			snsHateDao.delete(snsHate);
			//return json=snsTimeLine.snsTimeLine(principal);
		}
//		else if(snsHateInsert.getSnsLike()==0) {
//			
//		}
//		if (likeCheck == false) {
//			boolean insert = snsHateDao.hate(snsHate);
//			if (insert) {
//				return json = snsTimeLine.snsTimeLine(principal);
//			}
//		} else if (check == true) {
//			boolean delResult=snsHateDao.likeDelete(snsHate);
//			if(delResult==true) {
//				return json = snsTimeLine.snsTimeLine(principal);
//			}
//		}
		int hateTotal=snsHateDao.total(postNumber);
		int likeTotal = snsLikeDao.total(postNumber);
		JsonObject	totalObject= new JsonObject();
		totalObject.addProperty("hateTotal", hateTotal);
		totalObject.addProperty("likeTotal", likeTotal);
		return json=new Gson().toJson(totalObject);
	}// hateEnd

}
