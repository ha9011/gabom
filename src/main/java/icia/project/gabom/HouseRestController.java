package icia.project.gabom;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import icia.project.gabom.dao.IhouseDao;
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

	@GetMapping(value = "/housechangesearch" ,produces = "application/json;charset=utf-8")// ajax로 재검색 
	public String housechangesearch(@RequestParam("data")String house_address) {
		System.out.println(house_address);
		System.out.println("집재검색화면 가줘 ");
		
		String json = hs.housechangesearch(house_address);
		
		return json;
	}
	
	@RequestMapping(value = "/housereservation",produces = "application/json;charset=utf-8")//ajax로 insert
	public String housereservation(Principal principal, Housereservation hreservation) {
		System.out.println("예약하러 컨트롤러 오니?");
		System.out.println(hreservation.toString());
		String json = hs.housereservation(principal,hreservation);
		
		return json;
	
	}
}
