package icia.project.gabom;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	
	//정모 참석 리스트 부르기
	@RequestMapping(value = "/jungmoattendlist", produces="text/plain;charset=utf-8")
	public String jungmoattendlist(String JungmoNumber) {
		mav = new ModelAndView();
		System.out.println("정모리스트 부르기 // 정모방번호 : " + JungmoNumber);  // 참석자를 확인할 정모의 고유번호
		
		//셀렉트
		String result = simm.showAttendList(JungmoNumber);
		
		
		
		return result ; //new Gson().toJson(resultmap);
	}
	
	//소모임탈퇴
	@RequestMapping(value = "/dropoutsomoim", produces="text/plain;charset=utf-8")
	public String dropoutsomoim(int somoimnum, String somoimmaker, Principal pr ) {
		mav = new ModelAndView();
		System.out.println("정모삭제 // 소모임번호와 아이디 : " + somoimnum+ " : "+pr.getName());  // 참석자를 확인할 정모의 고유번호
		System.out.println("방장 : " + somoimmaker);
		//탈퇴하기
		String result = simm.deleteSomoim(somoimnum, somoimmaker,pr.getName());
		Map<String, String> map = new HashMap<String, String>();
		map.put("result", result);
		return new Gson().toJson(map); 
	}
	
}
