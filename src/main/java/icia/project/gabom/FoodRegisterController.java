package icia.project.gabom;

import java.security.Principal;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import icia.project.gabom.service.FoodRegisterService;


@Controller
public class FoodRegisterController {
	private ModelAndView mav;
	
	@Autowired
	private FoodRegisterService frs;
	
	@RequestMapping(value = "/foodshopRegister", method = RequestMethod.GET)
	public String foodshopRegister() {
		System.out.println("foodshopRegister");
		
		return "register/foodshopRegister";
	}	
	
	@PostMapping(value = "/foodRegisterUpload") //아이디 받아야함 
	public ModelAndView foodRegisterUpload(MultipartHttpServletRequest multi,Principal principal) {
		System.out.println("음식점 등록 컨트롤러");
		
		String member_hostid=principal.getName();
		System.out.println(multi.getParameter("food_name"));
		System.out.println(multi.getParameter("food_address"));
		System.out.println(multi.getParameter("food_ypoint"));
		System.out.println(multi.getParameter("food_xpoint"));

		System.out.println("시간날짜1 : " + multi.getParameter("food_mindate"));
		System.out.println("시간날짜2: " + multi.getParameter("food_maxdate"));
		
		System.out.println("시간민 : " + multi.getParameter("food_mintime"));
		System.out.println("시간맥스: " + multi.getParameter("food_maxtime"));
		
		List<MultipartFile> files=multi.getFiles("food_menuImages");
		System.out.println(files.size());
		System.out.println("files="+files.get(0).getOriginalFilename());
		
		mav= frs.foodRegisterUpload(multi,principal);
		System.out.println("완료되면 뷰로 보여줘");
		return mav;
	}
	

}
