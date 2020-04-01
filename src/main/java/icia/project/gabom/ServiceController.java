package icia.project.gabom;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import icia.project.gabom.service.ServiceCenterManagement;

@Controller
public class ServiceController {
	private ModelAndView mav;
	
	@Autowired
	private ServiceCenterManagement sm;
	
	@RequestMapping(value = "/servicecenter", method = RequestMethod.GET)
	public ModelAndView servicecenter() {
		System.out.println("서비스 컨트롤러");
		mav = new ModelAndView();
		System.out.println("servicecenter");
		mav = sm.servicecenter();
		
		return mav;
	}
	
}
