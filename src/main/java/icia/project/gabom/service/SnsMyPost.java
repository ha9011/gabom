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
import icia.project.gabom.dao.SnsMyPostDao;
import icia.project.gabom.dto.Member;
import icia.project.gabom.dto.SnsLikeHateCounter;
import icia.project.gabom.dto.SnsPhoto;
import icia.project.gabom.dto.SnsTimeLineResult;
import icia.project.gabom.dto.Snsposts;


@Service
public class SnsMyPost {
		
	@Autowired
	private IsnstimelineDao snsTimeLineDao;
	@Autowired
	private GetProfileDao getProfile;
	@Autowired
	SnsMyPostDao snsMyPost;

	@Transactional
	public String myPost(int low, Principal principal) {
		String json = null;
		String id = principal.getName();
		if(low==0) {
			low=1;
		}
		int lowNum=5*low;
		SnsTimeLineResult result = null;
		HashMap<Integer, SnsTimeLineResult> snsTimeLineResultMap = new HashMap<Integer, SnsTimeLineResult>();
		List<Snsposts> snsWriteTimeLine = snsMyPost.myPost(id,lowNum);// 글 5개를 가져와서
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
				result = setPost(result, post, photoList, likeHateCounter, member,commentCount);
				snsTimeLineResultMap.put(number,result);
			}
		}
		json = new Gson().toJson(snsTimeLineResultMap);
		return json;
	}
	private SnsTimeLineResult setPost(SnsTimeLineResult result, Snsposts post, List<SnsPhoto> photoList,
			SnsLikeHateCounter likeHateCounter, Member member, int commentCount) {
			result.setLike(likeHateCounter.getSnsLike())
			.setHate(likeHateCounter.getSnsHate());
		result.setPosts_number(post.getSns_posts_number()).setPosts_writer(post.getSns_posts_writer())
				.setContent(post.getSns_posts_content()).setPosts_hashtag(post.getSns_posts_hashtag())
				.setPosts_authority(post.getSns_posts_authority()).setPosts_report(post.getSns_posts_report())
				.setSns_posts_date(post.getSns_posts_date()).setSns_posts_edit_date(post.getSns_posts_edit_date())
				.setProfilePicture(member.getMember_profile_picture()).setCommentCount(commentCount);
		result.setPhotoList(photoList);
		return result;
	}
}
