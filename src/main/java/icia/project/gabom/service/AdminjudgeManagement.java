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

		List<Adminhouse> hlist = aDao.getHouseList(); // house 등록타입0번인 리스트 담아오기
		List<Adminfood> flist = aDao.getFoodList(); // food 등록타입 0번인 리스트 담아오기
		//List<Adminnotices> nlist = aDao.getadnotices(); //전체공지 정보 출력
		System.out.println("List=" + hlist);
		System.out.println("flist=" + flist);
		//System.out.println("nlist="+nlist);

		String hson = new Gson().toJson(hlist);
		String fson = new Gson().toJson(flist);
		//String nson = new Gson().toJson(nlist);

		mav.addObject("housejudge", hson);
		mav.addObject("foodjudge", fson);
		//mav.addObject("allnotices",nson);
		System.out.println("hson=" + hson);
		System.out.println("fson=" + fson);
		//System.out.println("nson=" + nson);

		mav.setViewName("adminmenu");
		return mav;
	} // housejudgelist End

	// 심사 승인 서비스(Rest)
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

	// 심사 거절 서비스(Rest)
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
	
	//전체공지 조회수 업데이트
	public boolean viewsUpdate(String num) {
		System.out.println("조회수 am 오니?");
		System.out.println("뭘 들고있지?"+num);
		boolean views = aDao.viewsUpdate(num);
		System.out.println(views);
		System.out.println("view="+views);
		
		return views;
	}

	public String selectTripSharePlanList() {
		
		List<Trip_plan> myplanlist = aDao.getmyplan();//내 여행목록
		
		
		return new Gson().toJson(myplanlist);
	}

	public String judgeplanshare(String judge, int tnum) {
		// TODO Auto-generated method stub

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
