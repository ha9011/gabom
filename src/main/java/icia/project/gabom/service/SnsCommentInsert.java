package icia.project.gabom.service;

import java.lang.annotation.Target;
import java.security.Principal;
import java.text.SimpleDateFormat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.google.gson.Gson;

import icia.project.gabom.dao.SnsCommentDao;
import icia.project.gabom.dao.SnsCommentInsertDao;
import icia.project.gabom.dto.Member;
import icia.project.gabom.dto.SnsCommentDto;
import icia.project.gabom.dto.SnsCommentResult;
import icia.project.gabom.dto.SnsLikeHateCounter;

@Service
public class SnsCommentInsert {

	@Autowired
	SnsCommentInsertDao snsCommnetInsertDao;
	@Autowired
	SnsComment snsComment;
	@Autowired
	SnsCommentDao snsCommentDao;
	
	@Transactional
	public String insert(int postNumber, String commentContent, Principal principal) {
		SnsCommentResult snsCommentResult= new SnsCommentResult();
		SnsCommentDto comment= new SnsCommentDto();
		comment.setPostNumber(postNumber)
		.setContent(commentContent)
		.setId(principal.getName());
		boolean result= snsCommnetInsertDao.insert(comment);
			if(result) {
				SnsCommentDto commentResult=
				snsCommnetInsertDao.select(comment.getCommentNumber());
				Member profilePic= new Member();
				SnsLikeHateCounter snsLikeHateCounter= new SnsLikeHateCounter();
				snsLikeHateCounter=snsCommentDao.commentLikeHateGet(commentResult.getCommentNumber());
				profilePic=snsCommentDao.snsCommentProfilePic(commentResult.getId());
				snsCommentResult=setResult(profilePic,commentResult,snsLikeHateCounter);
			}
		return new Gson().toJson(snsCommentResult);
	}
	private SnsCommentResult setResult(
			Member profilePic, SnsCommentDto comment, SnsLikeHateCounter snsLikeHateCounter) {
			SimpleDateFormat format1 = new SimpleDateFormat ("yyyy-MM-dd");
			String commentDate=format1.format(comment.getCommentDate());
			String editDate=format1.format(comment.getEditDate());
			SnsCommentResult snsCommentResult= new SnsCommentResult();
			snsCommentResult.setNumber(comment.getCommentNumber())
			.setContent(comment.getContent())
			.setId(comment.getId())
			.setDate(commentDate)
			.setEditDate(editDate)
			.setPostNumber(comment.getPostNumber())
			.setReport(comment.getReport())
			.setProfilePic(profilePic.getMember_profile_picture())
			.setLike(snsLikeHateCounter.getSnsLike())
			.setHate(snsLikeHateCounter.getSnsHate());
		return snsCommentResult;
	}
}
