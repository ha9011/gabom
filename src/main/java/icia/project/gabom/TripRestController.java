package icia.project.gabom;

import java.security.Principal;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import icia.project.gabom.dao.ITripplanDao;
import icia.project.gabom.dto.Trip_plan;
import icia.project.gabom.service.TripService;

@RestController
public class TripRestController {
	private ModelAndView mav;
	
	private ITripplanDao tpDao;
	private TripService trs;
	
	@PostMapping(value = "/savetripplan" ,produces = "application/json;charset=utf-8")// ajax로 재검색 
	public String savetripplan(Trip_plan tp, Principal ppl ) {
		System.out.println("여행플랜 저장");
		
		String json = trs.savetripplan(tp,ppl );
		
		return json;
	}

}
