package icia.project.gabom;

import java.util.Enumeration;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import icia.project.gabom.dto.Member;
import icia.project.gabom.service.JoinMemberManageMent;
@Controller
public class JoinMemberController {

	@Autowired
	private JoinMemberManageMent JMMM;
	
	ModelAndView mav;
	
	//회원가입 페이지로 이동
	@RequestMapping(value = "/joinselecttype", method = RequestMethod.GET)
	public String joinselecttype() {
		System.out.println("회원가입 페이지 첫단계 type설정");
		return "joinMember/joinselecttype";
	}
	
	@RequestMapping(value = "/joinmember", method = RequestMethod.GET)
	public ModelAndView joinmember(Member mb) {
		System.out.println("회원가입 페이지 이동");
		System.out.println("맴버 타입 : " +mb.getMember_type());
		mav = new ModelAndView();
		mav.addObject("type", mb.getMember_type());
		mav.setViewName("joinMember/joinmember");
		return mav;
	}
	
	//return "joinMember/joinmember";
	
	//회원가입버튼 누름
	@RequestMapping(value = "/joinmemberAction", method = RequestMethod.POST)
	public ModelAndView joinmemberAction(MultipartHttpServletRequest multi) {
		System.out.println("회원가입 데이터 입력");
		
//		Enumeration<String> e = multi.getParameterNames();
//		while(e.hasMoreElements()) {
//			System.out.println("e의 요소 : " + e.nextElement());
//		}
		mav = new ModelAndView();
		
		mav = JMMM.joinmemberAction(multi); //회원가입insert
		
		
		return mav;
	}
	
}
