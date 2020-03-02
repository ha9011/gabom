package icia.project.gabom.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import icia.project.gabom.dao.IAdminDao;
import icia.project.gabom.dto.Adminfood;
import icia.project.gabom.dto.Adminhouse;

@Service
public class AdminjudgeManagement {
	@Autowired
	private IAdminDao aDao;
	private ModelAndView mav;
	
	public ModelAndView housejudgelist() {
		mav = new ModelAndView();
		List<Adminhouse> hlist = aDao.getHouseList(); //house 등록타입0번인 리스트 담아오기
		System.out.println("List="+hlist);
		System.out.println("List="+hlist.get(0));
		System.out.println("hlist="+hlist.size());
		
		List<Adminfood> flist = aDao.getFoodList(); //food 등록타입 0번인 리스트 담아오기
		System.out.println("flist="+flist);
		
		
		String hson = new Gson().toJson(hlist);
		
		String fson = new Gson().toJson(flist);
		
		
		mav.addObject("housejudge", hson);
		mav.addObject("foodjudge", fson);
		System.out.println("hson="+hson);
		System.out.println("fson="+fson);
		//mav.addObject("gg", food);
		
		mav.setViewName("adminmenu");
		return mav;
	} //housejudgelist End

	//미사용
//	public ModelAndView detailjudge() {
//		mav = new ModelAndView();
//		//이프 타입.이퀄"house","food"
//		List<String> jlist = aDao.getjudgedetail();
//		return null;
//	}
	//미사용
//	public ModelAndView modaljudge() {
//		mav = new ModelAndView();
//		System.out.println("111");
//		List<String> jlist = aDao.getjudgemodal();
//		System.out.println("222");
//		return null;
//	}
	
	
}//class End
