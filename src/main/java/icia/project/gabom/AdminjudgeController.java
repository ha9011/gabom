package icia.project.gabom;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

public class AdminjudgeController {

private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	private ModelAndView mav;
	
	@RequestMapping(value = "/", method = RequestMethod.POST)
	public ModelAndView servicejudgelist() {
		System.out.println("");
		mav = new ModelAndView();
		
		mav.setViewName("");
		
		return mav;
	}
	
	
	
	
}
