package icia.project.gabom;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import icia.project.gabom.dao.ITripplanDao;
import icia.project.gabom.dto.Housereservation;
import icia.project.gabom.dto.Trip_member;
import icia.project.gabom.dto.Trip_plan;
import icia.project.gabom.dto.Trip_plan_date;
import icia.project.gabom.service.TripApiService;
import icia.project.gabom.service.TripService;

@Controller
public class TripController {
   
   private ModelAndView mav;
   
//   @Autowired
//   private ITripplanDao tpDao;
   
   @Autowired
   private TripService trs;
   
   @Autowired
	private TripApiService ts; //api서비스
   
   
   @RequestMapping(value = "/trip", method = RequestMethod.GET)
   public String trip() {
      System.out.println("여행계획");
      
      return "Trip/Tripplan";
   }
   
   @RequestMapping(value = "/myplan", method = RequestMethod.GET)
   public ModelAndView myplan(Principal ppl,Trip_member tm) {
      System.out.println("내여행 목록");
      
      mav=trs.myplan(ppl,tm);
      return mav;
   }
   
   
   @RequestMapping(value = "/detailplan", method = RequestMethod.GET)
   public ModelAndView detailplan(Principal ppl,int trip_number) {
      System.out.println("상세 여행 플랜");
      
      //System.out.println("여행번호:"+trip_number);
      
      
      mav=trs.detailplan(trip_number,ppl );
      //System.out.println(mav);
      return mav;
   }
   //tripdetailapi
   @RequestMapping(value = "/tripdetailapi", method = RequestMethod.GET)
	public ModelAndView tripdetailapi(String contentid) {
		System.out.println("tripdetailapi");
		System.out.println("contentid="+contentid);
		mav = new ModelAndView();
		
		String resultJson = ts.getdetailCommon(contentid);
		mav.addObject("detailcommon", resultJson);  //${qwe}
		mav.setViewName("Trip/tripdetailapi");
		return mav;
	}

   
   @RequestMapping(value = "/triphouse", method = RequestMethod.GET)
	public ModelAndView triphouse(int trip_number,Principal ppl,String areaCode,int currentPlanDay) {
			System.out.println("여행번호"+trip_number);
			System.out.println("여행지역"+areaCode);
			System.out.println("여행일수 "+currentPlanDay);
			
			mav=trs.triphouse(trip_number,areaCode,ppl,currentPlanDay );
			
		return mav;
	}
  
   @RequestMapping(value = "/triphousedetail", method = RequestMethod.GET)
	public ModelAndView triphousedetail(int house_number,Housereservation reserlist,Principal ppl,Trip_plan_date td) {
		System.out.println("여행숙박선택");
		System.out.println(house_number);
		System.out.println(td.getTrip_day());
		System.out.println(td.getTrip_number());
		mav = trs.triphousedetail(house_number,reserlist,ppl,td);
		return mav;
	}
  //choicehotel 
   
   @RequestMapping(value = "/choicehotel", method = RequestMethod.GET)
  	public ModelAndView choicehotel() {
  		System.out.println("호텔선택");
  		ModelAndView mav = new ModelAndView();
  		mav.setViewName("choicehotel");
  		return mav;
  	}
}