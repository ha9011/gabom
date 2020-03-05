package icia.project.gabom.service;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import icia.project.gabom.dao.IhouseDao;
import icia.project.gabom.dto.House;
import icia.project.gabom.dto.Housereservation;

@Service
public class Houseservice {
	
	private ModelAndView mav;
	
	@Autowired
	private IhouseDao hDao;
	

	public ModelAndView getHouseList(House house) {//메인에 출력하는 집 리스트 (전체 보유 리스트)
		//System.out.println("여기 오니?");
		mav = new ModelAndView();
		String view = null;
		String json = null;
		
		List<House> houselist = hDao.getHouseList();
		//System.out.println("houselist"+houselist.size());
		//System.out.println(houselist);
		view="house/housemain";
		json = new Gson().toJson(houselist);
		mav.addObject("houselist", json); // key,value
		
		System.out.println("집목록 ");
		mav.setViewName(view); //view에 url로 이동
		return mav;
	}


	public ModelAndView searchhouse(String house_address,House house) {//검색했을 때 출력되는 리스트
		mav = new ModelAndView();
		String view = null;
		String json = null;
		
		List<House> searchhouse = hDao.searchhouse(house_address);
		//System.out.println("searchhouse="+searchhouse);
		//System.out.println(house_address);
		view="house/houseSearchDetail";
		
		
		
		json = new Gson().toJson(searchhouse);
		//System.out.println("json="+json);
		mav.addObject("searchhouse",json);
		System.out.println("검색결과 보여줘 ");
		mav.setViewName(view); //view에 url로 이동
		return mav;
	}


	public String housechangesearch(String house_address) {
		String json = null;
		System.out.println("재검색 하러 오고있니?");
		
		List<House> changesearch = hDao.changesearch(house_address);
		//System.out.println("changesearch="+changesearch);
		//System.out.println(house_address);
		
		json = new Gson().toJson(changesearch);
		//System.out.println("json="+json);
		System.out.println("검색결과 보여줘 ");
		
		return json;
	}


	public ModelAndView housedetail(String house_number, Housereservation reserlist) {
		mav = new ModelAndView();
		String view = null;
		String json = null;
		String json2 = null;
		
		List<House> detailhouse = hDao.detailhouse(house_number);
		
		List<Housereservation> detailreser = hDao.detailreser(house_number);
		//System.out.println("detailhouse="+detailhouse);
		//System.out.println(house_number);
		view="house/housedetail";
		
		
		json = new Gson().toJson(detailhouse);
		json2 = new Gson().toJson(detailreser);
		//System.out.println("json="+json);
		System.out.println("json2="+json2);
		mav.addObject("detailhouse",json);
		mav.addObject("detailreser",json2);
		
		System.out.println("해당 방 정보 보여줘");
		mav.setViewName(view); //view에 url로 이동
		return mav;
	}


	public String housereservation(Principal principal, Housereservation hreservation) {
		String json = null;
		System.out.println("예약하러  오니?");
		String member_guestid=principal.getName();
		int house_number= hreservation.getHouse_number();
		String house_hostid= hreservation.getHouse_hostid();
		int reservation_totalprice=hreservation.getReservation_totalprice();
		int reservation_person=hreservation.getReservation_person();
		String reservation_checkin=hreservation.getReservation_checkin();
		String reservation_checkout=hreservation.getReservation_checkout();		
		
		hreservation.setHouse_hostid(house_hostid).setHouse_number(house_number).setMember_guestid(member_guestid);
		hreservation.setReservation_checkin(reservation_checkin).setReservation_checkout(reservation_checkout);
		hreservation.setReservation_person(reservation_person).setReservation_totalprice(reservation_totalprice);
		
		int reservation_number = hDao.housereservation(hreservation);
		
		json = new Gson().toJson(hreservation);
		System.out.println("json="+json);
		System.out.println("예약했니?");
		
		return json;
	}


}
