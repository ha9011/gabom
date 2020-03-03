package icia.project.gabom;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import icia.project.gabom.dao.IhouseDao;
import icia.project.gabom.dto.House;
import icia.project.gabom.service.Houseservice;

@Controller
public class Housecontroller { //검색, 메인, 상세보기 컨트롤러
	
	private ModelAndView mav;
	
	@Autowired
	private Houseservice hs;

	@Autowired
	private IhouseDao hDao;
	
	@RequestMapping(value = "/housechoice", method = RequestMethod.GET) // 숙박타입 선택 jsp
	public String housechoice() {
		
		return "house/housechoice";
	}
	
	@RequestMapping(value = "/housemain") // 숙소 메인 jsp
	public ModelAndView housemain(House house) {
		System.out.println("집 목록 보여줘 ");
		//String member_hostid=principal.getName();
		//List<House> houselist = hDao.getHouseList();
		//System.out.println("houselist"+houselist.size());
		//System.out.println(houselist.toString());
		
		mav=hs.getHouseList(house);
		
		return mav;
	}
	
	@GetMapping(value = "/searchhouse") //메인에서 검색된 결과 페이지 
	public ModelAndView searchhouse(String house_address,House house) {
		System.out.println(house_address);
		System.out.println("검색화면 가줘 ");
		
		mav = hs.searchhouse(house_address,house);
		
		return mav;
	}
	
	@RequestMapping(value = "/housedetail", method = RequestMethod.GET)
	public ModelAndView housedetail(String house_number) {
		System.out.println("housedetail");
		System.out.println("집번호는"+house_number);
		
		mav = hs.housedetail(house_number);
		return mav;
	}
	
	

}
