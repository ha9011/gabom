package icia.project.gabom.service;

import java.lang.annotation.Target;
import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import icia.project.gabom.dao.SnsCommentInsertDao;
import icia.project.gabom.dto.Member;
import icia.project.gabom.dto.SnsCommentDto;

@Service
public class SnsCommentInsert {

	@Autowired
	SnsCommentInsertDao snsCommnetInsertDao;
	@Autowired
	SnsComment snsComment;
	@Transactional
	public String insert(int postNumber, String commentContent, Principal principal) {
		String json=null;
		SnsCommentDto comment= new SnsCommentDto();
		comment.setPostNumber(postNumber)
		.setContent(commentContent)
		.setId(principal.getName());
		boolean result= snsCommnetInsertDao.insert(comment);
			if(result) {
				//SnsCommentDto SelectComment=snsCommnetInsertDao.select(comment);
				//Member member=snsCommnetInsertDao.picSelect(comment);
				json=snsComment.snsComment(comment.getPostNumber());
			}
		return json;
	}

}
