package icia.project.gabom.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import icia.project.gabom.dao.IAdminDao;
import icia.project.gabom.dto.House;

@Service
public class AdminjudgeManagement {
	@Autowired
	private IAdminDao aDao;
	private ModelAndView mav;
	
	public ModelAndView housejudgelist() {
		mav = new ModelAndView();
		List<House> hlist = aDao.getHouseList();
		System.out.println("hlist="+hlist.size());
		
		return mav;
	} //housejudgelist End
	
	
}//class End
