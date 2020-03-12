package icia.project.gabom.service;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import icia.project.gabom.dao.SnsLikeDao;
import icia.project.gabom.dto.SnsLikeHateCounter;

@Service
public class SnsLike {

	@Autowired
	SnsLikeDao snsLikeDao;
	@Autowired
	SnsTimeLineService snsTimeLine;

	public String like(Principal principal, int postNumber) {
		String json = null;
		SnsLikeHateCounter snsLike = new SnsLikeHateCounter();
		snsLike.setMemberId(principal.getName()).setPostNumber(postNumber);
		SnsLikeHateCounter snsLikeCheck = new SnsLikeHateCounter();
		snsLikeCheck = snsLikeDao.check(snsLike);
		if (snsLikeCheck == null) {
			boolean insert = snsLikeDao.like(snsLike);
			if (insert) {
				return json = snsTimeLine.snsTimeLine(principal);
			}
		}else if (snsLikeCheck.getSnsHate() == 1&& snsLikeCheck.getSnsLike()==0) {
			snsLikeDao.hateCancel(snsLike);
			return json = snsTimeLine.snsTimeLine(principal);
		}
		else if(snsLikeCheck.getSnsLike()==0) {
			 snsLikeDao.likeUpdate(snsLike);
			 return json = snsTimeLine.snsTimeLine(principal);}
			// snsLikeDao.delete(snsLike);
			// return json = snsTimeLine.snsTimeLine(principal);
			// }
		else if (snsLikeCheck.getSnsLike() == 1) {
			boolean delResult = snsLikeDao.likeCancel(snsLike);
			if (delResult == true) {
				return json = snsTimeLine.snsTimeLine(principal);
			}
		} 
//		else if(snsLikeCheck.getSnsHate()==0) {
//			 snsLikeDao.likeUpdate(snsLike);
//			 return json = snsTimeLine.snsTimeLine(principal);
//		 }
		

		return json;
	}

}
