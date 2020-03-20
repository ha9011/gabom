package icia.project.gabom.service;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import icia.project.gabom.dao.IMyInfoDao;
import icia.project.gabom.dto.Foodreservation;
import icia.project.gabom.dto.Housereservation;
import icia.project.gabom.dto.Member;

@Service
public class MyInfoManagement {
	
	private Member mb ;
	private ModelAndView mav;
	@Autowired
	private IMyInfoDao minfDao;

	public ModelAndView showMyInfo(Principal principal) {
		mav = new ModelAndView();
		
		mb = minfDao.selectshowMyInfo(principal.getName());
		System.out.println("mb데이터 : " + mb.toString());
		// TODO Auto-generated method stub
		mav.addObject("myinfodata", mb);
		mav.setViewName("myinfo");
		return mav;
	}
	
	
	//용돈 충전 AJAX
	public String restChargeMoney(String chargeMoney, String name) {
		
		mb = new Member();
		int result = minfDao.restChargeMoney(chargeMoney, name);
		System.out.println("result : " + result);
		if(result == 1 ) {
			mb = minfDao.selectshowMyInfo(name);
		}
		
		Gson gs = new Gson();
		String json = gs.toJson(mb);
		System.out.println( "json  : " + json );
		
		return json;
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
//=================================================================================================== 이예상
	public String myreser(Principal pc) {
		String json =null;
		System.out.println("여행 목록 가져와라");
		
		String member_guestid = pc.getName();
		
		List<Housereservation> Hlist = minfDao.getmyreser(member_guestid);
		
		json = new Gson().toJson(Hlist);
		System.out.println(json);
		return json;
	}

	
	public String myfreser(Principal pc) {
		String json =null;
		System.out.println("여행 목록 가져와라");
		
		String member_guestid = pc.getName();
		
		List<Foodreservation> flist = minfDao.getmyfreser(member_guestid);
		
		json = new Gson().toJson(flist);
		System.out.println(json);
		return json;
	}


	public String deletehreser(Housereservation hr,Principal pc ) {
		String json =null;
		
		int reservation_number= hr.getReservation_number();
		String member_guestid = pc.getName();
		
		minfDao.deletehreser(reservation_number);//삭제하고 
		
		List<Housereservation> Hlist = minfDao.getmyreser(member_guestid);//다시 불러옴 
		
		json = new Gson().toJson(Hlist);
		System.out.println(json);
		
		return json;
	}


	public String deletefreser(Foodreservation fr, Principal pc) {
		String json =null;
		
		int foodreservation_number= fr.getFoodreservation_number();
		String member_guestid = pc.getName();
		
		minfDao.deletefreser(foodreservation_number);//삭제하고 
		
		List<Foodreservation> flist = minfDao.getmyfreser(member_guestid);//다시 불러옴 
		
		json = new Gson().toJson(flist);
		System.out.println(json);
		
		return json;
	}
	
}
