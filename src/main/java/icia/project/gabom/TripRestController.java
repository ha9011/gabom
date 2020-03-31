package icia.project.gabom;

import java.security.Principal;
import java.text.ParseException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import icia.project.gabom.dao.ITripplanDao;
import icia.project.gabom.dto.Housereservation;
import icia.project.gabom.dto.Sns_friend;
import icia.project.gabom.dto.TripPlanDay;
import icia.project.gabom.dto.TripPlanDetail;
import icia.project.gabom.dto.Trip_member;
import icia.project.gabom.dto.Trip_plan;
import icia.project.gabom.dto.Trip_plan_date;
import icia.project.gabom.dto.Tripmemoupdate;
import icia.project.gabom.service.TripService;

@RestController
@RequestMapping(value = "/tprest")
public class TripRestController {
   
	private ModelAndView mav;
	
   @Autowired
   private ITripplanDao tpDao;
   
   @Autowired
   private TripService trs;
   
     
   //여행1단계 저장
   @PostMapping(value = "/savetripplan" ,produces = "application/json;charset=utf-8")
   public String savetripplan(Trip_plan tp, Principal ppl ) throws ParseException {
      System.out.println("여행플랜 저장");
      
      System.out.println("목적지"+tp.getTrip_area());
//      System.out.println("여행자 아이디"+ppl.getName());
//      System.out.println("시작날짜"+tp.getTrip_start_date());
//      System.out.println("끝나는날 "+tp.getTrip_end_date());
//      System.out.println("여행제목 "+tp.getTrip_title());
      
      String json = trs.savetripplan(tp,ppl);
      
      System.out.println(json);
      
      return json;
   }
   
   
   
 //친구 초대 (공유하기)
   @PostMapping(value = "/togetherplan" ,produces = "application/json;charset=utf-8")
   public String togetherplan(Trip_member tm, Principal ppl) {
      System.out.println("친구초대 ");
      
      System.out.println("친구 아이디:" +tm.getShare_id());
      System.out.println("내 아이디:"+ppl.getName());
      System.out.println("여행번호:"+tm.getTrip_number());
      
      String json = trs.togetherplan(tm,ppl);
      
      System.out.println(json);
      
      return json;
   }
   
   //초대 승인
   @PostMapping(value = "/accepttrip" ,produces = "application/json;charset=utf-8")
   public String accepttrip(Trip_member tm, Principal ppl) {
      //System.out.println("여행번호:"+tm.getTrip_number());
     //System.out.println("내 아이디:"+ppl.getName());
      
      String json = trs.accepttrip(tm,ppl);
      
      //System.out.println(json);
      
      return json;
   }
   
   
   @PostMapping(value = "/rejecttrip" ,produces = "application/json;charset=utf-8")
   public String rejecttrip(Trip_member tm, Principal ppl) {
      //System.out.println("여행번호:"+tm.getTrip_number());
      //System.out.println("내 아이디:"+ppl.getName());
      
      String json = trs.rejecttrip(tm,ppl);
      
      //System.out.println(json);
      
      return json;
   }
   
   @PostMapping(value = "/inserttripchatting" ,produces = "application/json;charset=utf-8")
   public String inserttripchatting(
		   @RequestParam("id")String id,
			@RequestParam("msg")String msg,
			@RequestParam("tripNum")int tripNum,
			Principal ppl
			) {
      System.out.println("여행 채팅 접근 input-insert");
      
      String json = trs.insertchatting(id,msg,tripNum);
      
      return json;
   }
   
   
   //인피니티 채팅
   @PostMapping(value = "/selectDateChatting" ,produces = "application/json;charset=utf-8")
   public String selectDateChatting(
		   @RequestParam("date")String date,
			@RequestParam("tripNum")int tripNum,
			Principal ppl
			) {
      System.out.println("여행 채팅 접근 input-insert");
      System.out.println("date  : " + date);
      String json = trs.selectDateChatting(date,tripNum);
      
      return json;
   }
   
   //...뭐더라...여행계획 저장하기
   @PostMapping(value = "/insertPlanDetail" ,produces = "application/json;charset=utf-8")
   public String insertPlanDetail(
		    String day,
		    String tripNum,
		    String tripData,
			Principal ppl
			) {
      System.out.println("여행계획저장 접근");
    
      
      String json = trs.insertPlanDetail(day,tripNum,tripData,ppl);
      System.out.println("해당날짜 결과 : " + json);
      return json;
   }
   
   //...오른쪽 , 왼쪽 이동할때
   @PostMapping(value = "/movePlanDay" ,produces = "application/json;charset=utf-8")
   public String movePlanDay(
		    String day,
		    String tripNum,
			Principal ppl
			) {
      System.out.println("오른쪽/왼쪽 이동");
    
      
      String json = trs.selectMovePlanDay(day,tripNum,ppl);
      System.out.println("해당날짜 결과 : " + json);
      return json;
   }
   @PostMapping(value = "/tripreservation",produces = "application/json;charset=utf-8")//ajax로 insert
	public String tripreservation(Principal principal, Housereservation hreservation,Trip_plan_date td) {
//		System.out.println("예약하러 컨트롤러 오니?");
//		System.out.println(hreservation.toString());
//		System.out.println("여행일수 "+td.getTrip_day());
//		System.out.println("여행번호"+td.getTrip_number());
		
		String json = trs.tripreservation(principal,hreservation,td);
		System.out.println("test");
		return json;
	
	}
	@PostMapping(value = "/tripmemoupdate",produces = "application/json;charset=utf-8") //ajax로 update
	public String tripmemoupdate(Tripmemoupdate tripup){
		System.out.println("메모추가하러 오니?");
		System.out.println("trip_number"+tripup.getTrip_number());
		System.out.println("trip_date"+tripup.getTrip_date());
		System.out.println("trip_order"+tripup.getTrip_order());
		System.out.println("trip_title"+tripup.getTrip_title());
		System.out.println("trip_memo"+tripup.getTrip_memo());
		
		String json = trs.updatetripmemo(tripup);
		
		
//		System.out.println("trip_date"+trip_date);
//		System.out.println("trip_order"+trip_order);
//		System.out.println("trip_title"+trip_title);
//		System.out.println("trip_memo"+trip_memo);
		
		
		
		return null;
	
	}
   
   
   
}