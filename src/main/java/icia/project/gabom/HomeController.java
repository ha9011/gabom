package icia.project.gabom;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

/**
 * Handles requests for the application home page.zzz
 */

@Controller
public class HomeController {
	
	
	private ModelAndView mav;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	

	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String home() {
		System.out.println("home");
		
		
		return "home";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		System.out.println("login");
		
		
		return "login/login";
	}
	
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String join() {
		System.out.println("join");
		return "home";
	}
	
	
	
	
	@RequestMapping(value = "/houseRegister", method = RequestMethod.GET)
	public String houseRegister() {
		System.out.println("houseRegister");
		
		return "register/houseRegister";
	}
	
	
	
	
	@RequestMapping(value = "/foodshopRegister", method = RequestMethod.GET)
	public String foodshopRegister() {
		System.out.println("foodshopRegister");
		
		return "register/foodshopRegister";
	}
	

	

}
