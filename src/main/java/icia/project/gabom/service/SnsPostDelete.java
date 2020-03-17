package icia.project.gabom.service;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import icia.project.gabom.dao.SnsPostDeleteDao;

@Service
public class SnsPostDelete {
	
	@Autowired
	SnsPostDeleteDao postdel;
	
	@Autowired
	SnsTimeLineService timeLine;
	
	
	
	@Transactional
	public String delete(int postNumber, Principal principal) {
		String json=null;
		boolean result=postdel.commentServiceDel(postNumber);
		result=postdel.commentDel(postNumber);
		result= postdel.postServiceDel(postNumber);
		result= postdel.postPhotoDel(postNumber);
		result= postdel.postDel(postNumber);
		if(result) {
			json=timeLine.snsTimeLine(principal, 0);
		}
		return json;
	}
	
	
	
}
