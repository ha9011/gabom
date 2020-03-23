package icia.project.gabom.service;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;

import icia.project.gabom.dao.SnsTimeLineProfileDao;
import icia.project.gabom.dto.SnsProfilePost;
import icia.project.gabom.dto.SnsTimeLineProfileBoxDto;
import icia.project.gabom.dto.Sns_friend;

@Service
public class SnsTimeLineProfileBox {

	@Autowired
	SnsTimeLineProfileDao snsTimeLineProfileDao;
	
	public String profile(String id, Principal principal) {
			//가져올 목록 아이디 이름 친구숫자 프로필 사진 글 개수 내소개
		//21일 추가 할 항목 친구 상태 
		SnsTimeLineProfileBoxDto result=null;
		SnsProfilePost profilePost=snsTimeLineProfileDao.profilePost(id);
		if(profilePost!=null||profilePost==null) {
			Sns_friend friendStatus=snsTimeLineProfileDao.friendStatus(id,principal.getName());
			Sns_friend reverseStatus=snsTimeLineProfileDao.reverse(id,principal.getName());
			if(friendStatus==null||friendStatus!=null
					||reverseStatus==null||reverseStatus!=null) {
				Sns_friend friend=snsTimeLineProfileDao.friendTot(id);
				Sns_friend friendRequest=snsTimeLineProfileDao.friendRequest(id);
				result= new SnsTimeLineProfileBoxDto();
				result=setResult(profilePost,friend,friendRequest,result,friendStatus,reverseStatus);
			}
		}
		
		return new Gson().toJson(result);
	}

	private SnsTimeLineProfileBoxDto setResult(SnsProfilePost profilePost,
			Sns_friend friend,
			Sns_friend friendRequest,
			SnsTimeLineProfileBoxDto result, Sns_friend friendStatus, Sns_friend reverseStatus) {
			result.setId(profilePost.getId()).setName(profilePost.getName())
			.setPic(profilePost.getPic()).setContent(profilePost.getContent())
			.setPost(profilePost.getPost()).setFriend(friend.getFriend_status())
			.setFriendRequset(friendRequest.getFriend_status());
			if(friendStatus==null) {
				result.setFriendStatus(0);
			}else {
				result.setFriendStatus(friendStatus.getFriend_status());
			}
			if(reverseStatus==null) {
				result.setReverse(0);
			}else {
				result.setReverse(reverseStatus.getFriend_status());
			}
		return result;
	}


	}

	
	
	
	
	

