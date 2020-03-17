package icia.project.gabom.service;

import java.security.Principal;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.TreeMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.google.gson.Gson;

import icia.project.gabom.dao.GetProfileDao;
import icia.project.gabom.dao.IsnstimelineDao;
import icia.project.gabom.dto.Member;
import icia.project.gabom.dto.SnsLikeHateCounter;
import icia.project.gabom.dto.SnsPhoto;
import icia.project.gabom.dto.SnsTimeLineResult;
import icia.project.gabom.dto.Snsposts;

@Service
public class SnsTimeLineService {

	@Autowired
	private IsnstimelineDao snsTimeLineDao;
	@Autowired
	private GetProfileDao getProfile;

	@Transactional
	public String snsTimeLine(Principal principal, int low) {
		String json = null;
		String id = principal.getName();
		if(low==0) {
			low=1;
		}
		int lowNum=5*low;
		SnsTimeLineResult result = null;
		HashMap<Integer, SnsTimeLineResult> snsTimeLineResultMap = new HashMap<Integer, SnsTimeLineResult>();
		List<Snsposts> snsWriteTimeLine = snsTimeLineDao.getsnsTimeLine(id,lowNum);// 글 15개를 가져와서
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

	public String mytimeline(Snsposts snsposts, Principal principal) {
		String json = null;
		System.out.println("내 타임라인 글");

		String sns_posts_writer = principal.getName();
		System.out.println("내아이디" + sns_posts_writer);

		List<Snsposts> mytimeline = snsTimeLineDao.getmytimeline(snsposts, sns_posts_writer);

		json = new Gson().toJson(mytimeline);
		System.out.println("json=" + json);

		return json;

	}

	public String friendtimeline(Snsposts snsposts, Principal principal) {
		String json = null;
		System.out.println("친구 타임라인 글");

		String friend_my_id = principal.getName();
		System.out.println(friend_my_id);
		List<Snsposts> friendtimeline = snsTimeLineDao.getfriendtimeline(snsposts, friend_my_id);

		json = new Gson().toJson(friendtimeline);
		System.out.println("json=" + json);

		return json;
	}

}
