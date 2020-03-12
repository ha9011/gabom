package icia.project.gabom.service;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import icia.project.gabom.dao.SnsHateDao;
import icia.project.gabom.dto.SnsLikeHateCounter;

@Service
public class SnsHate {

	@Autowired
	SnsTimeLineService snsTimeLine;
	@Autowired
	SnsHateDao snsHateDao;

	public String Hate(Principal principal, int postNumber) {
		String json = null;
		SnsLikeHateCounter snsHate = new SnsLikeHateCounter();
		snsHate.setMemberId(principal.getName()).setPostNumber(postNumber);
		SnsLikeHateCounter snsHateInsert = new SnsLikeHateCounter();
		snsHateInsert = snsHateDao.likeCheck(snsHate);
		if (snsHateInsert == null) {
			System.out.println(snsHate.getPostNumber());
			System.out.println(snsHate.getMemberId());
			boolean insertResult=snsHateDao.hateInsert(snsHate);
			if(insertResult) {
				return json=snsTimeLine.snsTimeLine(principal);
			}
		}else if (snsHateInsert.getSnsLike()==1&&snsHateInsert.getSnsHate()==0) {
			boolean cancelResult = snsHateDao.likeCancel(snsHate);
			if(cancelResult) {
				return json=snsTimeLine.snsTimeLine(principal);
			}
		} 
		else if(snsHateInsert.getSnsHate()==0) {
			snsHateDao.upDate(snsHate);
			return json=snsTimeLine.snsTimeLine(principal);
		} else if(snsHateInsert.getSnsHate()==1){
			snsHateDao.delete(snsHate);
			return json=snsTimeLine.snsTimeLine(principal);
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

		return json;
	}// hateEnd

}
