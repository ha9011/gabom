package icia.project.gabom.service;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import icia.project.gabom.dao.IMyInfoDao;
import icia.project.gabom.dto.Member;

@Service
public class MyInfoManagement {
	
	private Member mb ;
	private ModelAndView mav;
	@Autowired
	private IMyInfoDao minfDao;

	public ModelAndView showMyInfo(Principal principal) {
		mav = new ModelAndView();
		
		mb = minfDao.selectshowMyInfo(principal.getName());
		System.out.println("mb데이터 : " + mb.toString());
		// TODO Auto-generated method stub
		mav.addObject("myinfodata", mb);
		mav.setViewName("myinfo");
		return mav;
	}
	
	
	//용돈 충전 AJAX
	public String restChargeMoney(String chargeMoney, String name) {
		
		mb = new Member();
		int result = minfDao.restChargeMoney(chargeMoney, name);
		System.out.println("result : " + result);
		if(result == 1 ) {
			mb = minfDao.selectshowMyInfo(name);
		}
		
		Gson gs = new Gson();
		String json = gs.toJson(mb);
		System.out.println( "json  : " + json );
		
		return json;
	}

}
