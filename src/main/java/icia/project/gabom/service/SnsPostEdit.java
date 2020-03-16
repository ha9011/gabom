package icia.project.gabom.service;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import icia.project.gabom.dao.SnsPostEditDao;
import icia.project.gabom.dto.Snsposts;

@Service
public class SnsPostEdit {
	
	@Autowired
	SnsPostEditDao snsPostEditDao;
	@Autowired
	SnsTimeLineService snsTimeLine;
	
	public String edit(String editContents, int postNumber, Principal principal) {
		String json=null;
		Snsposts snsPost= new Snsposts();
		snsPost.setSns_posts_number(postNumber).setSns_posts_content(editContents);
		System.out.println(snsPost.getPostsNumber());
		System.out.println(snsPost.getSns_posts_content());
		int result=snsPostEditDao.editPost(snsPost);
		System.out.println(result);
		if(result!=0) {
			json=snsTimeLine.snsTimeLine(principal, 0);
		}else {
			json="실패";
		}
		return json;
	}

	
	
	
	
}
