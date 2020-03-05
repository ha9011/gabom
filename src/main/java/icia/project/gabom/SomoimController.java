package icia.project.gabom;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import icia.project.gabom.dto.Somoim;
import icia.project.gabom.service.SomoimManagement;

@Controller
@RequestMapping(value = "/somoim")
public class SomoimController {

	@Autowired
	private SomoimManagement simm;
	
	private ModelAndView mav;
	
	@RequestMapping(value = "/mainsomoim", method = RequestMethod.GET)
	public ModelAndView adminmenu(Principal pr) {
		mav = new ModelAndView();
		System.out.println("소모임메인 페이지 접근");
		//처음 페이지에 정보를 쏴줄게 많음, 아직 미구현, 소모임 개설 하는 페이지를 만들고 진행해야함
		//1. 내가 만든 소모임 나오게 하기 (-ing)
		mav = simm.selectMainSomoim(pr,mav);
		return mav;
	}
	
	@RequestMapping(value = "/makesomoim", method = RequestMethod.GET)
	public String makeSomoim(Principal pr) {
		System.out.println("소모임 만들기 아이디 ");
		//System.out.println("소모임 만들기 아이디 : " +  pr.getName());
		
		return "somoim/makesomoim";
	}
	
	@RequestMapping(value = "/somoimregister", method = RequestMethod.POST)
	public String somoimregister(Principal pr, MultipartHttpServletRequest multi ) {
		System.out.println("소모임 만들기 ");
		System.out.println("로그인 아이디  : " +pr.getName());
		
		//방만들고 방장은 자동으로 somoim_member 테이블에 완료
		String result = simm.InsertSomoim(multi,pr);
		
		//mav = simm.selectMainSomoim(pr,mav);
		//return mav;
		
		//view = somoim/mainsomoim
		return "redirect:"+result;
	}
	
	@RequestMapping(value = "/somoimroom", method = RequestMethod.GET)
	public String somoimroom(Principal pr) {
		System.out.println("소모임 room 입장");
		
		return "somoim/somoimroom";
	}
}
