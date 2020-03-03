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

	// adminmenu.jsp 접속시 house,food 출력
	public ModelAndView housejudgelist() {
		mav = new ModelAndView();

		List<Adminhouse> hlist = aDao.getHouseList(); // house 등록타입0번인 리스트 담아오기
		List<Adminfood> flist = aDao.getFoodList(); // food 등록타입 0번인 리스트 담아오기

		System.out.println("List=" + hlist);
		System.out.println("flist=" + flist);

		String hson = new Gson().toJson(hlist);
		String fson = new Gson().toJson(flist);

		mav.addObject("housejudge", hson);
		mav.addObject("foodjudge", fson);
		System.out.println("hson=" + hson);
		System.out.println("fson=" + fson);

		mav.setViewName("adminmenu");
		return mav;
	} // housejudgelist End

	// 심사 승인 서비스(rest)
	public String judgeApproved(String number, String type) {
		System.out.println("am승인은 오니?");
		String json = null;
		if (type.equals("house")) {	//가져온 타입이 house면 house
			boolean result = aDao.houseApproved(number);
			System.out.println(result);
			if (result == true) {
				List<Adminhouse> hlist = aDao.getHouseList();
				json = new Gson().toJson(hlist);
			}
		} else if (type.equals("food")) { //가져온 타입이 food면 food
			boolean result = aDao.foodApproved(number);
			System.out.println(result);
			if (result == true) {
				List<Adminfood> hlist = aDao.getFoodList();
				json = new Gson().toJson(hlist);
			}
		}
		return json;
	}//judgeApproved End

	// 심사 거절 서비스
	public String judgerefuse(String number, String type) {
		System.out.println("am거절은 오니?");

		String json = null;
		if (type.equals("house")) { //가져온 타입이 house면 house
			boolean result = aDao.housefuse(number);
			System.out.println(result);
			if (result == true) {
				List<Adminhouse> hlist = aDao.getHouseList();
				json = new Gson().toJson(hlist);
			}
		} else if (type.equals("food")) { //가져온 타입이 food면 food
			boolean result = aDao.foodfuse(number);
			System.out.println(result);
			if (result == true) { 
				List<Adminfood> hlist = aDao.getFoodList();
				json = new Gson().toJson(hlist);
			}
		}

		return json;
	}//judgerefuse End

}// class End
