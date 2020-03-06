package icia.project.gabom;

import java.security.Principal;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import icia.project.gabom.dto.Jungmoroom;
import icia.project.gabom.service.SomoimManagement;

@RestController
@RequestMapping(value = "/somoim")
public class RestSomoimController {
	
	private ModelAndView mav ; 
	
	@Autowired
	private SomoimManagement simm;
	
	@RequestMapping(value = "/jungmomoim", produces="text/plain;charset=utf-8")
	public String jungmomoim(Principal pr, Jungmoroom jungmoroom ) {
		mav = new ModelAndView();
		System.out.println("정모 만들기");
		
		String checkInsert = simm.insertSelecttMakeJunmoRoom(jungmoroom); //일단 인서트 성공
		 //일단 인서트 성공
		//1. 공지 닮을내용부터 다 뽑기, (1)타이틀, 사진, 소개내용 (2)정모게시판 (3)회원맴버
		//(1),(3)은 지금 바로 가능 
		//mav = simm.somoimRoomData(mav,roomnum, pr);
		System.out.println("jsonJungmoRooms : " + checkInsert);
		
		return checkInsert;
	}	
	
	@RequestMapping(value = "/attendjungmo", produces="text/plain;charset=utf-8")
	public String attendjungmo(Principal pr, @RequestParam HashMap<String, String> map, Jungmoroom jungmoroom) {
		mav = new ModelAndView();
		System.out.println("정모에 참석하기");
		String result = simm.attendjungmo(pr,map,jungmoroom);
		
		HashMap<String, String> resultmap = new HashMap<String, String>();
		resultmap.put("result", result);
		
		return new Gson().toJson(resultmap);
	}
	
	@RequestMapping(value = "/cancelAttendjunmo", produces="text/plain;charset=utf-8")
	public String cancelAttendjunmo(@RequestParam HashMap<String, String> map,Principal pr,Jungmoroom jungmoroom) {
		mav = new ModelAndView();
		System.out.println("정모에 참석하기");
		String result = simm.cancelAttendjunmo(pr,map,jungmoroom);
		
		HashMap<String, String> resultmap = new HashMap<String, String>();
		resultmap.put("result", result);
		return new Gson().toJson(resultmap);
	}
}
