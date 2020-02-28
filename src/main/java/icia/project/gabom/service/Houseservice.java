package icia.project.gabom.service;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import icia.project.gabom.dao.IhouseDao;
import icia.project.gabom.dto.House;

@Service
public class Houseservice {
	
	private ModelAndView mav;
	
	@Autowired
	private IhouseDao hDao;
	

	public ModelAndView getHouseList(House house) {
		System.out.println("여기 오니?");
		String view = null;
		
		List<House> houselist = hDao.getHouseList();
		System.out.println("houselist"+houselist.size());
		System.out.println(houselist);
		
		//mav.addObject("houselist", houselist); // key,value
		view="housemain.jsp";
	
		System.out.println("집목록 ");
		mav.setViewName(view); //view에 url로 이동
		return mav;
	}


}
