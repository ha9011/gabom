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
		return "joinMember/joinselecttype";
	}
	
	@RequestMapping(value = "/joinmember", method = RequestMethod.GET)
	public ModelAndView joinmember(Member mb) {
		mav = new ModelAndView();
		mav.addObject("type", mb.getMember_type());  // 여행객, 서비스업체 둘중 한 타입 선택
		mav.setViewName("joinMember/joinmember");    // 본격 회가입 페이지 이동
		return mav;
	}
	
	//return "joinMember/joinmember";
	
	//회원가입버튼 누름
	@RequestMapping(value = "/joinmemberAction", method = RequestMethod.POST)
	public ModelAndView joinmemberAction(MultipartHttpServletRequest multi) {
		mav = new ModelAndView();
		mav = JMMM.joinmemberAction(multi); //회원가입 input들의 데이터는 multi에 담겨있음
		return mav;
	}
	
}
