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

import com.google.gson.Gson;

import icia.project.gabom.dao.ITripplanDao;
import icia.project.gabom.dto.Housereservation;
import icia.project.gabom.dto.Sns_friend;
import icia.project.gabom.dto.TripPlanDay;
import icia.project.gabom.dto.TripPlanDetail;
import icia.project.gabom.dto.Trip_SavePlan;
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
   
 //여행 공유 저장
   @PostMapping(value = "/shareplansave" ,produces = "application/json;charset=utf-8")
   public String shareplansave(
		   @RequestParam(value="rangedate[]")String[] rangedate,
		   @RequestParam("tripnum")int tripnum,
		   Principal ppl 
	) throws ParseException {
     
	  System.out.println("여행 추천 저장");
	  
	  String json = trs.insertSharePlan(rangedate,tripnum, ppl.getName());
	  
      return "";
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
	@PostMapping(value = "/tripmemoselect",produces = "application/json;charset=utf-8") //ajax로 update
	public String tripmemoselect(Tripmemoupdate tripup){
		System.out.println("메모찾으러 오니?");
		System.out.println("trip_number"+tripup.getTrip_number());
		System.out.println("trip_date"+tripup.getTrip_date());
		System.out.println("trip_order"+tripup.getTrip_order());
		System.out.println("trip_title"+tripup.getTrip_title());
		System.out.println("trip_memo"+tripup.getTrip_memo());
		
		String selectmemo = trs.selecttripmemo(tripup);
		String json = new Gson().toJson(selectmemo);
		System.out.println("메모컨트롤러 셀렉후="+json);
		
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
		
		
		return null;
	
	}
   
	@PostMapping(value = "/tripplanapply",produces = "application/json;charset=utf-8") //ajax로 update
	public String tripplanapply(
			@RequestParam("tripPlanNum") int tripPlanNum,
			Principal pr,
			@RequestParam("tripPlanStatus") int tripPlanStatus
	){
		System.out.println("여헹계획승인");
		System.out.println("tripPlanNum : " +tripPlanNum);
		
		String result = trs.TripPlanApply(tripPlanNum, tripPlanStatus,pr.getName());
		System.out.println("result : " + result);

		return result;
	
	}
   
	//여행 만들기에서 여행플랜 추천 지역검색
	@PostMapping(value = "/searchtrippaln",produces = "application/json;charset=utf-8")
	public String searchtrippaln(@RequestParam("data")String trip_area ){
		System.out.println("여행지역 검색"+trip_area);
		String json = trs.searchtrippaln(trip_area);
		return json;
	}
	
	//모달 클릭시 나오는 여행정보 
	@PostMapping(value = "/getplan",produces = "application/json;charset=utf-8")
	public String getplan(@RequestParam("trip_number")int trip_number ){
		System.out.println("여행번호"+trip_number);
		String json = trs.getplan(trip_number);
		return json;
	}
	
	
	//여행 취소할 경우
		@PostMapping(value = "/cancelReservation",produces = "application/json;charset=utf-8")
		public String getplan(
				@RequestParam("tripNum")int tripNum,
				@RequestParam("currentPlanDay")int currentPlanDay,
				@RequestParam("resernumber")int resernumber,
				@RequestParam("dbnum")int dbnum,
				Principal pr
				){
			System.out.println("예약 취소 하기");
			System.out.println("tripNum : " +tripNum);
			System.out.println("currentPlanDay : " +currentPlanDay);
			System.out.println("resernumber : " +resernumber);
			
			String json = trs.cancelReservation(tripNum,currentPlanDay,resernumber,dbnum);
			
			return json;
		}
   //여행계획 추가 addPlanDate
		@PostMapping(value = "/addPlanDate",produces = "application/json;charset=utf-8")
		public String addPlanDate(
				@RequestParam("tripnumber")int tripnumber,
				@RequestParam("addDate")String addDate,
				@RequestParam("nDate")int nDate,
				Principal pr
				){
			System.out.println("예약 취소 하기");
			System.out.println("tripnumber : " +tripnumber);
			System.out.println("addDate : " +addDate);
			System.out.println("nDate : " +nDate);
			
			String json = trs.addPlanDate(tripnumber,addDate,nDate);
			System.out.println("여행날짜 추가 하고 최종결과값 : " + json);
			return json;
		}
	//여행계획 삭제
		@PostMapping(value = "/delePlanDate",produces = "application/json;charset=utf-8")
		public String delePlanDate(
				@RequestParam("tripnumber")int tripnumber,
				@RequestParam("deleDate")String deleDate,
				@RequestParam("nDate")int nDate,
				@RequestParam("currentDay")int currentDay,
				@RequestParam("endDate")String endDate,
				Principal pr
				){
			System.out.println("예약 취소 하기");
			System.out.println("tripnumber : " +tripnumber);
			System.out.println("deleDate : " +deleDate);
			System.out.println("nDate : " +nDate);
			System.out.println("currentDay : " +currentDay);
			System.out.println("endDate : " +endDate);
			
			String json = trs.delePlanDate(tripnumber,deleDate,nDate,currentDay,endDate);
			System.out.println("여행날짜 삭제 하고 최종결과값 : " + json);
			return json;
		}
		
		//여행계획 마지막 날 삭제
				@PostMapping(value = "/delePlanDateLast",produces = "application/json;charset=utf-8")
				public String delePlanDateLast(
						@RequestParam("tripnumber")int tripnumber,
						@RequestParam("deleDate")String deleDate,
						@RequestParam("nDate")int nDate,
						@RequestParam("currentDay")int currentDay,
						@RequestParam("endDate")String endDate,
						Principal pr
						){
					System.out.println("예약 마지막 날 취소 하기");
					System.out.println("tripnumber : " +tripnumber);
					System.out.println("deleDate : " +deleDate);
					System.out.println("nDate : " +nDate); // 몇번째 여행인지
					System.out.println("currentDay : " +currentDay);
					System.out.println("endDate : " +endDate);
					
					String json = trs.delePlanDateLast(tripnumber,deleDate,nDate,currentDay,endDate);
					System.out.println("여행날짜 삭제 하고 최종결과값 : " + json);
					return json;
				}
				
				//여행계획 삭제
				@PostMapping(value = "/deleteTripPlan",produces = "application/json;charset=utf-8")
				public String deleteTripPlan(
						@RequestParam("tripnumber")int tripnumber,
						Principal pr
						){
					System.out.println("예약 마지막 날 취소 하기");
					System.out.println("tripnumber : " +tripnumber);
					
					String json = trs.deleteTripPlan(tripnumber);
					
					return null;
				}		
				
				
				
		//여행계획날짜 변경
				@PostMapping(value = "/changeDay",produces = "application/json;charset=utf-8")
				public String changeDay(
						@RequestParam("tripNumber")int tripNumber,
						@RequestParam("newStartDayDB")String newStartDayDB,
						@RequestParam("newLastDayDB")String newLastDayDB,
						@RequestParam("rangeDay")int rangeDay,
						@RequestParam("diffOriNewFirstday")int diffOriNewFirstday,
						@RequestParam("changeTripTitle")String changeTripTitle,
						Principal pr
						){
					System.out.println("예약 취소 하기");
					System.out.println("tripNumber : " +tripNumber);
					System.out.println("newStartDayDB : " +newStartDayDB);
					System.out.println("newLastDayDB : " +newLastDayDB);
					System.out.println("rangeDay : " +rangeDay);
					System.out.println("diffOriNewFirstday : " +diffOriNewFirstday);
					System.out.println("changeTripTitle : " +changeTripTitle);
					
					String json = trs.changeDay(tripNumber,newStartDayDB,newLastDayDB,rangeDay,diffOriNewFirstday, changeTripTitle, pr.getName());
					//System.out.println("여행날짜 삭제 하고 최종결과값 : " + json);
					return json;
				}
}