package icia.project.gabom.service;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.google.gson.Gson;

import icia.project.gabom.dao.GetProfileDao;
import icia.project.gabom.dao.IsnstimelineDao;
import icia.project.gabom.dao.SnsUserPostDao;
import icia.project.gabom.dto.Member;
import icia.project.gabom.dto.SnsFriendStatus;
import icia.project.gabom.dto.SnsLikeHateCounter;
import icia.project.gabom.dto.SnsPhoto;
import icia.project.gabom.dto.SnsTimeLineResult;
import icia.project.gabom.dto.Snsposts;

@Service
public class SnsUserPosts {

	@Autowired
	SnsUserPostDao snsUserPostDao;
	@Autowired
	private IsnstimelineDao snsTimeLineDao;
	@Autowired
	private GetProfileDao getProfile;
	@Transactional
	public String userPosts(int row, String userId, Principal principal) {
		String json = null;
		if(row==0) {
			row=1;
		}
		int rowNum=5*row;
		int checkNum=snsUserPostDao.checkNumber(userId);
		if(rowNum>checkNum) {
			rowNum=checkNum;
		}
		SnsTimeLineResult result = null;
		HashMap<Integer, SnsTimeLineResult> snsTimeLineResultMap = new HashMap<Integer, SnsTimeLineResult>();
		List<Snsposts> snsWriteTimeLine=null;
		SnsFriendStatus status=snsUserPostDao.check(userId,principal.getName());
		if(status==null||status.getStatus()==0||status.getStatus()==1) {
			 snsWriteTimeLine = snsUserPostDao.userPublicPost(userId,rowNum);// 글 5개를 가져와서
		}else if (status.getStatus()==2) {
			 snsWriteTimeLine = snsUserPostDao.userFriendPost(userId,rowNum);
		}
		for (int i = 0; i < snsWriteTimeLine.size(); i++) {
			for (Snsposts post : snsWriteTimeLine) {
				int number = post.getSns_posts_number();
				result = new SnsTimeLineResult();
				SnsLikeHateCounter likeHateCounter = snsTimeLineDao.snsLikeHateCounter(number);
				List<SnsPhoto> photoList = snsTimeLineDao.snsPhotoTimeLine(number);
				Member member = new Member();
				int commentCount=snsTimeLineDao.commentCount(number);
				member.setMember_id(post.getSns_posts_writer());
				member = getProfile.getProfile(member);
				result = setPost(result, post, photoList,
						likeHateCounter, member,commentCount,checkNum,rowNum);
				snsTimeLineResultMap.put(number,result);
			}
		}
		json = new Gson().toJson(snsTimeLineResultMap);
		return json;
	}
	private SnsTimeLineResult setPost(SnsTimeLineResult result, Snsposts post, List<SnsPhoto> photoList,
			SnsLikeHateCounter likeHateCounter, Member member, int commentCount, int checkNum, int rowNum) {
			result.setLike(likeHateCounter.getSnsLike())
			.setHate(likeHateCounter.getSnsHate());
		result.setPosts_number(post.getSns_posts_number()).setPosts_writer(post.getSns_posts_writer())
				.setContent(post.getSns_posts_content()).setPosts_hashtag(post.getSns_posts_hashtag())
				.setPosts_authority(post.getSns_posts_authority()).setPosts_report(post.getSns_posts_report())
				.setSns_posts_date(post.getSns_posts_date()).setSns_posts_edit_date(post.getSns_posts_edit_date())
				.setProfilePicture(member.getMember_profile_picture()).setCommentCount(commentCount);
		result.setPhotoList(photoList).setMax(checkNum).setRowNum(rowNum);
		return result;
	}

}
