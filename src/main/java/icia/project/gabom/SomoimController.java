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
	
	
	@RequestMapping(value = "/mainsomoim", method = RequestMethod.GET)
	public String adminmenu() {
		System.out.println("소모임메인 페이지 접근");
		//처음 페이지에 정보를 쏴줄게 많음, 아직 미구현, 소모임 개설 하는 페이지를 만들고 진행해야함
		
		return "somoim/mainsomoim";
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
		//pr.getName();
		multi.setAttribute("somoim_maker", "aaa");
		//1 DB에 넣고, 그 후에 file 에 넣기
		String result = simm.InsertSomoim(multi);
		
		
		
		return result ;
	}
	
	
}
