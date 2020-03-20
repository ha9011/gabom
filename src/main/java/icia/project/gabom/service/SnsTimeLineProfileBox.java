package icia.project.gabom.service;

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
	
	public String profile(String id) {
			//가져올 목록 아이디 이름 친구숫자 프로필 사진 글 개수 내소개
		SnsTimeLineProfileBoxDto result=null;
		SnsProfilePost profilePost=snsTimeLineProfileDao.profilePost(id);
		if(profilePost!=null) {
			Sns_friend friend=snsTimeLineProfileDao.friendTot(id);
			Sns_friend friendRequest=snsTimeLineProfileDao.friendRequest(id);
			result= new SnsTimeLineProfileBoxDto();
			result=setResult(profilePost,friend,friendRequest,result);
		}
		
		return new Gson().toJson(result);
	}

	private SnsTimeLineProfileBoxDto setResult(SnsProfilePost profilePost,
			Sns_friend friend,
			Sns_friend friendRequest,
			SnsTimeLineProfileBoxDto result) {
			result.setId(profilePost.getId()).setName(profilePost.getName())
			.setPic(profilePost.getPic()).setContent(profilePost.getContent())
			.setPost(profilePost.getPost()).setFriend(friend.getFriend_status())
			.setFriendRequset(friendRequest.getFriend_status());
		return result;
	}


	}

	
	
	
	
	

