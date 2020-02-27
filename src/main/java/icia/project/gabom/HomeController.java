package icia.project.gabom;

import java.security.Principal;
import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

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
	public String home(Locale locale, Model model, HttpSession sess) {
		
		System.out.println("첫페이지 ");
		sess.setAttribute("testuserlogin", sess.getId());
		return "home";
	}
	



	@PreAuthorize("isAuthenticated()")
	@RequestMapping(value = "/houseRegister", method = RequestMethod.GET)
	public ModelAndView houseRegister(Principal principal) {
		System.out.println("houseRegister");
		mav = new ModelAndView();
		mav.setViewName("houseRegister");
		System.out.println("사용자 정보"+principal.getName());
		return mav;
	}
	
	
	
	
	@RequestMapping(value = "/foodshopRegister", method = RequestMethod.GET)
	public String foodshopRegister() {
		System.out.println("foodshopRegister");
		
		return "register/foodshopRegister";
	}
	

	

}
