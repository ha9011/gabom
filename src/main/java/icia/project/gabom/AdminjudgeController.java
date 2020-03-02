package icia.project.gabom;

import javax.servlet.http.HttpServletRequest;

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
	
	//미사용
//	@RequestMapping(value = "/sucess")
//	public ModelAndView judgedetail(HttpServletRequest req) {
//		mav = new ModelAndView();
//		System.out.println("modal");
//		//System.out.println("타입"+req.getAttribute("type"));
//		mav = am.detailjudge();
//		
//		return mav;
//	}
	
	//미사용
//	@RequestMapping(value = "/judgemodal")
//	public ModelAndView judgeModal() {
//		mav = new ModelAndView();
//		System.out.println("modal");
//		//System.out.println("타입"+req.getAttribute("type"));
//		mav = am.modaljudge();
//		
//		return mav;
//	}
	
	
	
	
}
