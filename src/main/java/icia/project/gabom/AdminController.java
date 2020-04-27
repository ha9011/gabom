package icia.project.gabom;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import icia.project.gabom.service.AdminjudgeManagement;

@Controller
public class AdminController {
	private ModelAndView mav;
	@Autowired
	private AdminjudgeManagement am; //관리자
		
	//어드민페이지로 이동
	@RequestMapping(value = "/adminmenu", method = RequestMethod.GET)
	public ModelAndView adminmenu() {
		mav = new ModelAndView();
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
	
	
	
	
}
