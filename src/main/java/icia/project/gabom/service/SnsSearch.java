package icia.project.gabom.service;

import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.google.gson.Gson;

import icia.project.gabom.dao.GetProfileDao;
import icia.project.gabom.dao.IsnstimelineDao;
import icia.project.gabom.dao.SnsSearchDao;
import icia.project.gabom.dto.Member;
import icia.project.gabom.dto.SnsFriendStatus;
import icia.project.gabom.dto.SnsLikeHateCounter;
import icia.project.gabom.dto.SnsPhoto;
import icia.project.gabom.dto.SnsSerachResult;
import icia.project.gabom.dto.SnsTimeLineResult;
import icia.project.gabom.dto.Snsposts;

@Service
public class SnsSearch {

	@Autowired
	SnsSearchDao snsSearchDao;
	@Autowired
	private IsnstimelineDao snsTimeLineDao;
	@Autowired
	private GetProfileDao getProfile;

	@Transactional
	public String search(String data, Principal principal, int postRow, int friendRow) {
		if(postRow==0||friendRow==0) {
			postRow=1;
			friendRow=1;
		}
		int postRowTotNum=10*postRow;
		int friendRowtotNum=10*friendRow;
		int postTotNum=snsSearchDao.checkPostTotNum(data);
		int friendtotNum=snsSearchDao.checkFriendTotNum(data);
		if(postRowTotNum>postTotNum) {
			postRowTotNum=postTotNum;
		}
		if(friendRowtotNum>friendtotNum) {
			friendRowtotNum=friendtotNum;
		}
		HashMap<String, List<SnsSerachResult>> total = new HashMap<String, List<SnsSerachResult>>();
		List<Snsposts> postList = snsSearchDao.searchPost(data, principal.getName(),postRowTotNum);
		List<Member> memberList = snsSearchDao.searchFriendList(data,friendRowtotNum);
		List<SnsSerachResult> publicResult = new ArrayList<SnsSerachResult>();
		List<SnsSerachResult> friendListResult = new ArrayList<SnsSerachResult>();
		for (Snsposts post : postList) {
			publicResult = setResult(post, publicResult,postRowTotNum,postTotNum);
		}
		total.put("publicPost", publicResult);
		for (Member member : memberList) {
			Member friendStatus = snsSearchDao.check(member.getMember_id(), principal.getName());
			if (friendStatus == null || friendStatus != null) {
				friendListResult = setFriendListResult(member,
						friendListResult,friendStatus,friendtotNum,friendRowtotNum);
			}
		}
		total.put("friendList",friendListResult);


		return new Gson().toJson(total);
	}

	@Transactional
	public String searchPost(int postNumber) {
		String json = null;
		SnsTimeLineResult result = null;
		HashMap<Integer, SnsTimeLineResult> snsTimeLineResultMap = new HashMap<Integer, SnsTimeLineResult>();
		List<Snsposts> snsWriteTimeLine = snsSearchDao.searchPostResult(postNumber);// 글 5개를 가져와서
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
	
	
	
	
	private List<SnsSerachResult> setFriendListResult(Member member, List<SnsSerachResult> friendListResult,
			Member friendStatus, int friendtotNum,
			int friendRowtotNum) {
		SnsSerachResult resultDto = new SnsSerachResult();
		resultDto.setId(member.getMember_id()).setPic(member.getMember_profile_picture())
		.setMax(friendtotNum).setRow(friendRowtotNum);
		if(friendStatus==null) {
			resultDto.setStatus(0);
		}else {
			resultDto.setStatus(friendStatus.getFriendstatus());
		}
		friendListResult.add(resultDto);
		return friendListResult;
	}

	
	
	
	
	private List<SnsSerachResult> setResult(Snsposts post, List<SnsSerachResult> resultArr,
			int postRowTotNum, int postTotNum) {
		SnsSerachResult resultDto = new SnsSerachResult();
		SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
		String date = format1.format(post.getSns_posts_date());
		resultDto.setPostNumber(post.getSns_posts_number()).setWriter(post.getSns_posts_writer()).setDate(date)
				.setReport(post.getSns_posts_report())
				.setContents(post.getSns_posts_content())
				.setMax(postTotNum)
				.setRow(postRowTotNum);
		resultArr.add(resultDto);
		return resultArr;
	}


}
