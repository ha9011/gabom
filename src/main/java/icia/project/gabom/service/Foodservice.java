package icia.project.gabom.service;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import icia.project.gabom.dao.IfoodDao;
import icia.project.gabom.dto.Food;

@Service
public class Foodservice {
	
	private ModelAndView mav;
	
	@Autowired
	private IfoodDao fDao;
	

	public ModelAndView getfoodList(Food food) {//메인에 출력하는 집 리스트 (전체 보유 리스트)
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


	public ModelAndView fooddetail(String food_number) {
		mav = new ModelAndView();
		String view = null;
		String json = null;
		
		List<Food> detailfood = fDao.detailfood(food_number);
		//System.out.println("detailfood="+detailfood);
		//System.out.println(food_number);
		view="food/fooddetail";
		
		
		json = new Gson().toJson(detailfood);
		//System.out.println("json="+json);
		mav.addObject("detailfood",json);
		//System.out.println("해당 음식점 정보 보여줘");
		mav.setViewName(view); //view에 url로 이동
		return mav;
	}


}
