package icia.project.gabom;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import icia.project.gabom.service.AdminjudgeManagement;

@Controller
public class AdminjudgeController {
	private ModelAndView mav;
	@Autowired
	private AdminjudgeManagement am; //관리자
	
	@RequestMapping(value = "/adminmenu", method = RequestMethod.GET)
	public ModelAndView adminmenu() {
		mav = new ModelAndView();
		System.out.println("adminmenu");
		
		mav = am.housejudgelist();
		
		return mav;
	}
	
	
	
}
