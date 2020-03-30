package icia.project.gabom;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import icia.project.gabom.dao.IfoodDao;
import icia.project.gabom.dto.Food_reple;
import icia.project.gabom.dto.Foodreservation;
import icia.project.gabom.dto.House_reple;
import icia.project.gabom.service.Foodservice;

@RestController
@RequestMapping(value = "/frest")
public class FoodRestController {

private ModelAndView mav;
	
	@Autowired
	private Foodservice fs;

	@Autowired
	private IfoodDao fDao;

	@PostMapping(value = "/foodchangesearch" ,produces = "application/json;charset=utf-8")// ajax로 재검색 
	public String foodchangesearch(@RequestParam("data")String food_address) {
		System.out.println(food_address);
		System.out.println("재검색화면 가줘 ");
		
		String json = fs.foodchangesearch(food_address);
		
		return json;
	}
	
	@RequestMapping(value = "/foodreservation",produces = "application/json;charset=utf-8") //메인에서 검색된 결과 페이지 
	public String foodreservation(Principal principal,Foodreservation freservation) {
		System.out.println("예약하러 컨트롤러 오니?");
		System.out.println(freservation.toString());
		
		String json = fs.foodreservation(freservation,principal);
		
		return json;
	
	}

	
	@PostMapping(value = "/insertreple" ,produces = "application/json;charset=utf-8")
	   public String insertreple(Principal ppl,Food_reple f_reple) {
		   System.out.println("숙박 댓글 입력 ");
		   System.out.println("댓글 입력 아이디:"+ppl.getName());
		   System.out.println("댓글 내용:"+f_reple.getFood_reple_content());
		   System.out.println("집 번호:"+f_reple.getFood_number());
		   
	      String json = fs.insertreple(f_reple,ppl);
	      
	      return json;
	   }
	
	@PostMapping(value = "/repledel", produces="text/plain;charset=utf-8")
	public String repledel(Food_reple f_reple) {
		System.out.println("댓글삭제 ");
		
		System.out.println("댓글번호"+f_reple.getFood_reple_number());
		System.out.println("집번호"+f_reple.getFood_number());
		
		String json = fs.repledel(f_reple);
		
		return json;
	}
	
	@PostMapping(value = "/fdreview", produces="text/plain;charset=utf-8")
	public String fdreview(@RequestParam("food_review_number")int food_review_number) {
		System.out.println("음식 리뷰 상세보기 ");
		
		System.out.println("리뷰번호"+food_review_number);
		
		String json = fs.fdreview(food_review_number);
		
		return json;
	}
}
