package icia.project.gabom;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MyinfoController {

	private ModelAndView mav;

	@RequestMapping(value = "/myinfo", method = RequestMethod.GET)
	public String myinfo() {


		return "myinfo";
	}
	
	@RequestMapping(value = "/serviceinfo", method = RequestMethod.GET)
	public String serviceinfo() {

		return "serviceinfo";
	}

}
