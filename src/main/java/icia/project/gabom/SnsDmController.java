package icia.project.gabom;

import java.security.Principal;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SnsDmController {
	@RequestMapping(value = "/snsdm")
	public ModelAndView snsDm(Principal principal) {
		ModelAndView mav= new ModelAndView();
		if(principal==null) {
			mav.setViewName("home");
		return mav;
		}
		mav.addObject("id", principal.getName());
		mav.setViewName("sns/snsDm");
		return mav;
	}
	
	
	@GetMapping(value ="/sns/dm/detail")
	public ModelAndView snsDmDetail(@RequestParam("userid")String userId,Principal principal) {
		ModelAndView mav= new ModelAndView();
		mav.addObject("userId",userId);
		mav.addObject("id",principal.getName());
		mav.setViewName("sns/snsDmDetail");
		return mav;
	}
	
	
	
}
