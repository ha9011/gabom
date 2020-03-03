package icia.project.gabom.service;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import icia.project.gabom.dao.IhouseDao;
import icia.project.gabom.dto.House;

@Service
public class Houseservice {
	
	private ModelAndView mav;
	
	@Autowired
	private IhouseDao hDao;
	

	public ModelAndView getHouseList(House house) {//메인에 출력하는 집 리스트 (전체 보유 리스트)
		System.out.println("여기 오니?");
		mav = new ModelAndView();
		String view = null;
		
		List<House> houselist = hDao.getHouseList();
		//System.out.println("houselist"+houselist.size());
		//System.out.println(houselist);
		
		mav.addObject("houselist", houselist); // key,value
		view="house/housemain";
	
		System.out.println("집목록 ");
		mav.setViewName(view); //view에 url로 이동
		return mav;
	}


	public ModelAndView searchhouse(String house_address,House house) {//검색했을 때 출력되는 리스트
		mav = new ModelAndView();
		String view = null;
		String json = null;
		
		List<House> searchhouse = hDao.searchhouse(house_address);
		System.out.println("searchhouse="+searchhouse);
		System.out.println(house_address);
		view="house/houseSearchDetail";
		
		
		
		json = new Gson().toJson(searchhouse);
		System.out.println("json="+json);
		mav.addObject("searchhouse",json);
		System.out.println("검색결과 보여줘 ");
		mav.setViewName(view); //view에 url로 이동
		return mav;
	}


	public String changesearch(String house_address) {
		String json = null;
		System.out.println("재검색 하러 오고있니?");
		
		List<House> changesearch = hDao.changesearch(house_address);
		System.out.println("changesearch="+changesearch);
		System.out.println(house_address);
		
		json = new Gson().toJson(changesearch);
		System.out.println("json="+json);
		System.out.println("검색결과 보여줘 ");
		
		return json;
	}


	public ModelAndView housedetail(String house_number) {
		mav = new ModelAndView();
		String view = null;
		String json = null;
		
		List<House> detailhouse = hDao.detailhouse(house_number);
		System.out.println("detailhouse="+detailhouse);
		System.out.println(house_number);
		view="house/housedetail";
		
		
		json = new Gson().toJson(detailhouse);
		System.out.println("json="+json);
		mav.addObject("detailhouse",json);
		System.out.println("해당 방 정보 보여줘");
		mav.setViewName(view); //view에 url로 이동
		return mav;
	}


}
