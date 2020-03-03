package icia.project.gabom;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import icia.project.gabom.dao.IfoodDao;
import icia.project.gabom.dto.Food;
import icia.project.gabom.service.Foodservice;

@Controller
public class FoodController { //검색, 메인, 상세보기 컨트롤러
	
	private ModelAndView mav;
	
	@Autowired
	private Foodservice fs;

	@Autowired
	private IfoodDao fDao;
	
	@RequestMapping(value = "/foodmain") // 숙소 메인 jsp
	public ModelAndView housemain(Food food) {
		System.out.println("집 목록 보여줘 ");
		mav=fs.getfoodList(food);
		
		return mav;
	}
	
	@GetMapping(value = "/searchfood") //메인에서 검색된 결과 페이지 
	public ModelAndView searchfood(String food_address) {
		System.out.println(food_address);
		System.out.println("검색화면 가줘 ");
		
		mav = fs.searchfood(food_address);
		
		return mav;
	}
	
	@RequestMapping(value = "/fooddetail", method = RequestMethod.GET)
	public ModelAndView fooddetail(String food_number) {
		System.out.println("fooddetail");
		System.out.println("음식점번호는"+food_number);
		
		mav = fs.fooddetail(food_number);
		return mav;
	}
	
	

}
