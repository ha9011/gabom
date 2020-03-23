package icia.project.gabom.service;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import icia.project.gabom.dao.IMyInfoDao;
import icia.project.gabom.dto.Foodreservation;
import icia.project.gabom.dto.House_review;
import icia.project.gabom.dto.Housereservation;
import icia.project.gabom.dto.Member;
import icia.project.gabom.dto.Trip_member;
import icia.project.gabom.userClass.House_reviewFlie;

@Service
public class MyInfoManagement {
	
	private Member mb ;
	private ModelAndView mav;
	@Autowired
	private IMyInfoDao minfDao;
	
	@Autowired
	private House_reviewFlie hrf;

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


	public String myhreview(Principal pc) {
		String json =null;
		
		String member_guestid = pc.getName();
		
		Map<String,Object> list = new HashMap<String, Object>();
		
		List<Housereservation> hlist = minfDao.getreviewmyreser(member_guestid);//작성할 리뷰
		List<Foodreservation> flist = minfDao.getreviewmyfreser(member_guestid);//작성할 리뷰
		
		//List<House_review> hrel = minfDao.getmyhrevie(member_guestid);//작성한 리뷰
		//List<House_review> frel = minfDao.getmyhrevie(member_guestid);//작성한 리뷰
		
		list.put("hlist", hlist);
		list.put("flist", flist);
		//list.put("hrel", hrel);
		//list.put("frel", frel);
		//작성한 리뷰 목록 같이 불러오기 
		
		json = new Gson().toJson(list);
		return json;
	}


	public String inserthreview(Principal pc, House_review hrv) {
		String json =null;
		
		String member_guestid = pc.getName();
		String house_review_content =hrv.getHouse_review_content();
		String house_review_orifile =hrv.getHouse_review_orifile();
		int house_number =hrv.getHouse_number();
		
		House_review hrv1=new House_review();
		hrv1.setHouse_number(house_number).setHouse_review_content(house_review_content);
		hrv1.setHouse_review_orifile(house_review_orifile).setMember_guestid(member_guestid);
		
		minfDao.inserthreview(hrv1);
		
		boolean f1= false;
		
		if(true) { //한번더 파일 있는지 체크 업로드
			f1=hrf.fileUpmain(house_review_orifile,);
		
		
		//json = new Gson().toJson();
		return json;
	}



	
}
