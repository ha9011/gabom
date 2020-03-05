package icia.project.gabom.service;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import icia.project.gabom.dao.IfoodDao;
import icia.project.gabom.dto.Food;
import icia.project.gabom.dto.Foodreservation;
import icia.project.gabom.dto.Housereservation;

@Service
public class Foodservice {
	
	private ModelAndView mav;
	
	@Autowired
	private IfoodDao fDao;
	

	public ModelAndView getfoodList(Food food) {//메인에 출력하는 음식점 리스트 (전체 보유 리스트)
		//System.out.println("여기 오니?");
		mav = new ModelAndView();
		String view = null;
		String json = null;
		
		List<Food> foodlist = fDao.getfoodList();
		view="food/foodmain";
		json = new Gson().toJson(foodlist);
		mav.addObject("foodlist", json); // key,value
		
		System.out.println("집목록 ");
		mav.setViewName(view); //view에 url로 이동
		return mav;
	}


	public ModelAndView searchfood(String food_address) {//검색했을 때 출력되는 리스트
		mav = new ModelAndView();
		String view = null;
		String json = null;
		
		List<Food> searchfood = fDao.searchfood(food_address);
		//System.out.println("searchhouse="+searchhouse);
		//System.out.println(house_address);
		view="food/foodSearchDetail";
		
		json = new Gson().toJson(searchfood);
		//System.out.println("json="+json);
		mav.addObject("searchfood",json);
		System.out.println("검색결과 보여줘 ");
		mav.setViewName(view); //view에 url로 이동
		return mav;
	}


	public String foodchangesearch(String food_address) {
		String json = null;
		System.out.println("재검색 하러 오고있니?");
		
		List<Food> foodchangesearch = fDao.foodchangesearch(food_address);
		//System.out.println("foodchangesearch="+foodchangesearch);
		//System.out.println(food_address);
		
		json = new Gson().toJson(foodchangesearch);
		//System.out.println("json="+json);
		//System.out.println("검색결과 보여줘 ");
		
		return json;
	}


	public ModelAndView fooddetail(String food_number, Foodreservation freserlist) {
		mav = new ModelAndView();
		String view = null;
		String json = null;
		String json2 = null;
		
		List<Food> detailfood = fDao.detailfood(food_number);
		List<Foodreservation> detailfreser = fDao.detailfoodreser(food_number);
		//System.out.println("detailfood="+detailfood);
		//System.out.println(food_number);
		view="food/fooddetail";
		
		
		json = new Gson().toJson(detailfood);
		json2 = new Gson().toJson(detailfreser);
		//System.out.println("json="+json);
		//System.out.println("json2="+json2);
		mav.addObject("detailfood",json);
		mav.addObject("detailfreser",json2);
		//System.out.println("해당 음식점 정보 보여줘");
		mav.setViewName(view); //view에 url로 이동
		return mav;
	}


	public String foodreservation(Foodreservation freservation, Principal principal) {
		String json = null;
	
		String member_guestid=principal.getName();
		int food_number=freservation.getFood_number();
		String food_hostid= freservation.getFood_hostid();
		int foodreservation_person= freservation.getFoodreservation_person();
		String foodreservation_date= freservation.getFoodreservation_date();
		String foodreservation_time= freservation.getFoodreservation_time();
		
		freservation.setFood_hostid(food_hostid).setFood_number(food_number).setMember_guestid(member_guestid);
		freservation.setFoodreservation_date(foodreservation_date).setFoodreservation_time(foodreservation_time);
		freservation.setFoodreservation_person(foodreservation_person);
		
		int foodreservation_number = fDao.foodreservation(freservation);
		
		json = new Gson().toJson(freservation);
		System.out.println("json="+json);
		
		return json;
	}


}
