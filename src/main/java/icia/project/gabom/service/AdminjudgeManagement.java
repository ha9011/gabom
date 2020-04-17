package icia.project.gabom.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import icia.project.gabom.dao.IAdminDao;
import icia.project.gabom.dto.Adminfood;
import icia.project.gabom.dto.Adminhouse;
//import icia.project.gabom.dto.Adminnotices;
import icia.project.gabom.dto.Trip_plan;

@Service
public class AdminjudgeManagement {
	@Autowired
	private IAdminDao aDao;
	private ModelAndView mav;

	// adminmenu.jsp 접속시 house,food 출력
	public ModelAndView housejudgelist() {
		mav = new ModelAndView();

		List<Adminhouse> hlist = aDao.getHouseList(); // house 등록타입0번인 리스트 담기
		List<Adminfood> flist = aDao.getFoodList(); // food 등록타입 0번인 리스트 담기

		String hson = new Gson().toJson(hlist);
		String fson = new Gson().toJson(flist);

		mav.addObject("housejudge", hson);
		mav.addObject("foodjudge", fson);

		mav.setViewName("adminmenu");
		return mav;
	} // housejudgelist End

	// 심사 승인 서비스
	public String judgeApproved(String number, String type) {
		
		String json = null;
		if (type.equals("house")) {	//가져온 타입이 house면 house
			boolean result = aDao.houseApproved(number);
		
			if (result == true) {
				List<Adminhouse> hlist = aDao.getHouseList();
				json = new Gson().toJson(hlist);
			}
		} else if (type.equals("food")) { //가져온 타입이 food면 food
			boolean result = aDao.foodApproved(number);
		
			if (result == true) {
				List<Adminfood> hlist = aDao.getFoodList();
				json = new Gson().toJson(hlist);
			}
		}
		return json;
	}//judgeApproved End

	// 심사 거절 서비스(Rest)
	public String judgerefuse(String number, String type) {

		String json = null;
		if (type.equals("house")) { //가져온 타입이 house면 house
			boolean result = aDao.housefuse(number);
			if (result == true) {
				List<Adminhouse> hlist = aDao.getHouseList();
				json = new Gson().toJson(hlist);
			}
		} else if (type.equals("food")) { //가져온 타입이 food면 food
			boolean result = aDao.foodfuse(number);
			if (result == true) { 
				List<Adminfood> hlist = aDao.getFoodList();
				json = new Gson().toJson(hlist);
			}
		}

		return json;
	}//judgerefuse End
	
	//전체공지 조회수 업데이트
	public boolean viewsUpdate(String num) {
		boolean views = aDao.viewsUpdate(num);
		
		return views;
	}

	public String selectTripSharePlanList() {
		
		List<Trip_plan> myplanlist = aDao.getmyplan();//내 여행목록
		
		return new Gson().toJson(myplanlist);
	}

	public String judgeplanshare(String judge, int tnum) {

		int result = 0 ;
		if(judge.equals("승인")) {
			result = aDao.updatePermit(tnum);
		}else if(judge.equals("거절")) {
			result = aDao.deletereject(tnum);
		}
		
		List<Trip_plan> myplanlist = aDao.getmyplan();//모든 여행 대기 목록
		
		return new Gson().toJson(myplanlist);
	}

}// class End
