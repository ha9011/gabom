package icia.project.gabom.service;

import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;

import icia.project.gabom.dao.IsnstimelineDao;
import icia.project.gabom.dto.Snsposts;

@Service
public class SnsTimeLineService {
	
	@Autowired
	private IsnstimelineDao snsTimeLineDao;

	public String snsTimeLine(Principal principal) {
		String json = null;
		String id=principal.getName();
		List<Snsposts> snsPhotoTimeLine=null;
		System.out.println("timeline 전체글 보여줘");
		HashMap<String,HashMap<String, List<Snsposts>>> snsTotalTimeLineList=
				new HashMap<String, HashMap<String,List<Snsposts>>>(); 
		HashMap<String, List<Snsposts>> snsTimeLinePhotoMap= new HashMap<String, List<Snsposts>>();
		HashMap<String, List<Snsposts>> snsTimeLineWriteMap= new HashMap<String, List<Snsposts>>();
		List<Snsposts> snsWriteTimeLine = snsTimeLineDao.getsnsTimeLine(id);
		for(int i=0;i<snsWriteTimeLine.size();i++) {
			int number=snsWriteTimeLine.get(i).getSns_posts_number();
			snsPhotoTimeLine = snsTimeLineDao.snsPhotoTimeLine(number);
			snsTimeLinePhotoMap.put("photoList"+i, snsPhotoTimeLine);
			 List<Snsposts> timeLineWriteList = new ArrayList<Snsposts>();
			 timeLineWriteList.add(0, snsWriteTimeLine.get(i));
			 snsTimeLineWriteMap.put("writeList"+i,timeLineWriteList);
		}
		snsTotalTimeLineList.put("write", snsTimeLineWriteMap);
		snsTotalTimeLineList.put("photo", snsTimeLinePhotoMap);
		
		json = new Gson().toJson(snsTotalTimeLineList);
		System.out.println("json="+json);
		return json;
	}

	public String mytimeline(Snsposts snsposts, Principal principal) {
		String json = null;
		System.out.println("내 타임라인 글");
		
		String sns_posts_writer =principal.getName();
		System.out.println("내아이디"+sns_posts_writer);
		
		List<Snsposts> mytimeline = snsTimeLineDao.getmytimeline(snsposts,sns_posts_writer);
		
		json = new Gson().toJson(mytimeline);
		System.out.println("json="+json);
		
		return json;
	
	}

	public String friendtimeline(Snsposts snsposts, Principal principal) {
		String json = null;
		System.out.println("친구 타임라인 글");
		
		String friend_my_id =principal.getName();
		System.out.println(friend_my_id);
		List<Snsposts> friendtimeline = snsTimeLineDao.getfriendtimeline(snsposts, friend_my_id);
		
		json = new Gson().toJson(friendtimeline);
		System.out.println("json="+json);
		
		return json;
	}
	

}
