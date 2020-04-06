package icia.project.gabom;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import icia.project.gabom.dao.IhouseDao;
import icia.project.gabom.dto.House_reple;
import icia.project.gabom.dto.Housereservation;
import icia.project.gabom.service.Houseservice;

@RestController
@RequestMapping(value = "/hrest")
public class HouseRestController {

	private ModelAndView mav;
	
	@Autowired
	private Houseservice hs;

	@Autowired
	private IhouseDao hDao;

	@PostMapping(value = "/housechangesearch" ,produces = "application/json;charset=utf-8")// ajax로 재검색 
	public String housechangesearch(@RequestParam("data")String house_address) {
		System.out.println(house_address);
		System.out.println("집재검색화면 가줘 ");
		
		String json = hs.housechangesearch(house_address);
		
		return json;
	}
	
	@PostMapping(value = "/housereservation",produces = "application/json;charset=utf-8")//ajax로 insert
	public String housereservation(Principal principal, Housereservation hreservation) {
		System.out.println("예약하러 컨트롤러 오니?");
		System.out.println(hreservation.toString());
		String json = hs.housereservation(principal,hreservation);
		
		return json;
	
	}
	
	   @PostMapping(value = "/insertreple" ,produces = "application/json;charset=utf-8")
	   public String insertreple(Principal ppl,House_reple h_reple) {
		   System.out.println("숙박 댓글 입력 ");
		   System.out.println("댓글 입력 아이디:"+ppl.getName());
		   System.out.println("댓글 내용:"+h_reple.getHouse_reple_content());
		   System.out.println("집 번호:"+h_reple.getHouse_number());
		   
	      String json = hs.insertreple(h_reple,ppl);
	      
	      return json;
	   }
	   
	   @PostMapping(value = "/hdreview", produces="text/plain;charset=utf-8")
		public String hdreview(@RequestParam("house_review_number")int house_review_number) {
			System.out.println("집 리뷰 상세보기 ");
			
			System.out.println("리뷰번호"+house_review_number);
			
			String json = hs.hdreview(house_review_number);
			
			return json;
		}
	   
	   
	   @PostMapping(value = "/repledel", produces="text/plain;charset=utf-8")
		public String repledel(House_reple h_reple) {
			System.out.println("댓글삭제 ");
			
			System.out.println("댓글번호"+h_reple.getHouse_reple_number());
			System.out.println("집번호"+h_reple.getHouse_number());
			
			String json = hs.repledel(h_reple);
			
			return json;
		}
	   
	   //호텔 크롤링 hotelsearch
	   @PostMapping(value = "/hotelsearch", produces="text/plain;charset=utf-8")
		public String hotelsearch(
				@RequestParam("address") String address,
				@RequestParam("checkin") String checkin,
				@RequestParam("checkout") String checkout
		) {
			System.out.println("크롤링 접근!");
			
			String html = hs.searchHotel(address,checkin,checkout);
			
			return html;
		}
}
