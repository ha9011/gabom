package icia.project.gabom;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import icia.project.gabom.service.AdminjudgeManagement;
import icia.project.gabom.service.TripApiService;

@Controller
public class AdminjudgeController {
	private ModelAndView mav;
	@Autowired
	private AdminjudgeManagement am; //관리자
	@Autowired
	private TripApiService ts; //api서비스
	
	//어드민페이지로 이동
	@RequestMapping(value = "/adminmenu", method = RequestMethod.GET)
	public ModelAndView adminmenu() {
		mav = new ModelAndView();
		System.out.println("adminmenu");
		mav = am.housejudgelist();
		
		return mav;
	}
	@RequestMapping(value = "/Apidate", method = RequestMethod.GET)
	public ModelAndView Apidate() {
		System.out.println("Apidate");
		mav = new ModelAndView();
		mav.setViewName("Apidate");
		return mav;
	}
	@RequestMapping(value = "/apitest", method = RequestMethod.GET)
	public ModelAndView apitest(String contentid) {
		System.out.println("apitest");
		System.out.println("contentid="+contentid);
		mav = new ModelAndView();
		String resultJson = ts.getdetailCommon(contentid);
		mav.addObject("detailcommon", resultJson);  //${qwe}
		mav.setViewName("apitest");
		return mav;
	}
	
	
	
}
