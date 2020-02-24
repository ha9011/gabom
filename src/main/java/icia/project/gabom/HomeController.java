package icia.project.gabom;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.zzz
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		System.out.println("login");
		return "home";
	}
	
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String join() {
		System.out.println("join");
		return "home";
	}
	
	@RequestMapping(value = "/myinfo", method = RequestMethod.GET)
	public String myinfo() {
		System.out.println("myinfo");
		return "home";
	}
	
	@RequestMapping(value = "/houseRegister", method = RequestMethod.GET)
	public String houseRegister() {
		System.out.println("houseRegister");
		return "home";
	}
	
	@RequestMapping(value = "/foodshopRegister", method = RequestMethod.GET)
	public String foodshopRegister() {
		System.out.println("foodshopRegister");
		return "home";
	}
	
}
