package icia.project.gabom.service;

import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;

import icia.project.gabom.dao.SnsSearchDao;
import icia.project.gabom.dto.Member;
import icia.project.gabom.dto.SnsSerachResult;
import icia.project.gabom.dto.Snsposts;

@Service
public class SnsSearch {

	@Autowired
	SnsSearchDao snsSearchDao;
	
	
	public String search(String data, Principal principal) {
		HashMap<String, List<SnsSerachResult>> total= new HashMap<String, List<SnsSerachResult>>();
		List<Snsposts> postList=snsSearchDao.searchPost(data);
		List<Snsposts> friendPostList=snsSearchDao.searchFriendPost(data,principal.getName());
		List<Member> memberList=snsSearchDao.searchFriendList(data);
		List<SnsSerachResult> publicResult= new ArrayList<SnsSerachResult>();
		List<SnsSerachResult> friendResult= new ArrayList<SnsSerachResult>();
		List<SnsSerachResult> friendListResult= new ArrayList<SnsSerachResult>();
		for(Snsposts post: postList) {
			publicResult=setResult(post,publicResult);
			total.put("publicPost", publicResult);
		}
		for(Snsposts post:friendPostList) {
			friendResult=setResult(post,friendResult);
			total.put("friendPost",friendResult);
		}
		for(Member member:memberList) {
			friendListResult=setFriendListResult(member,friendListResult);
			total.put("friendList",friendListResult);
		}
		
		
		return new Gson().toJson(total);
	}


	private List<SnsSerachResult> setFriendListResult(Member member, List<SnsSerachResult> friendListResult) {
		SnsSerachResult resultDto= new SnsSerachResult();
		resultDto.setId(member.getMember_id());
		friendListResult.add(resultDto);
		return friendListResult;
	}


	private List<SnsSerachResult> setResult(Snsposts post, List<SnsSerachResult> resultArr) {
		SnsSerachResult resultDto= new SnsSerachResult();
		SimpleDateFormat format1 = new SimpleDateFormat ("yyyy-MM-dd");
		String date=format1.format(post.getSns_posts_date());
		resultDto.setPostNumber(post.getSns_posts_number())
		.setWriter(post.getSns_posts_writer())
		.setDate(date)
		.setReport(post.getSns_posts_report())
		.setContents(post.getSns_posts_content());
		resultArr.add(resultDto);
		return resultArr;
	}

}
