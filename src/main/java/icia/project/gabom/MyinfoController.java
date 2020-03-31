package icia.project.gabom;

import java.security.Principal;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import icia.project.gabom.service.MyInfoManagement;

@Controller
public class MyinfoController {
	
	@Autowired
	private MyInfoManagement MIM;
	private ModelAndView mav;

	@RequestMapping(value = "/myinfo", method = RequestMethod.GET)
	public ModelAndView myinfo(Principal principal) {
		
		mav = new ModelAndView();
		System.out.println("유저 로그인 아이디 : " + principal.getName());
		// 해당 정보 가져오기
		mav = MIM.showMyInfo(principal);	
		
		
		return mav;
	}
	
	
	
	//서비스 친구
	@RequestMapping(value = "/serviceinfo", method = RequestMethod.GET)
	public String serviceinfo() {

		return "serviceinfo";
	}
	
	

}
