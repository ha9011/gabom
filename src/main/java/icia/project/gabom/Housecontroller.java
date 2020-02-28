package icia.project.gabom;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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

}
