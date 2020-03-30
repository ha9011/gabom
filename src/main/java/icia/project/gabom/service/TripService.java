package icia.project.gabom.service;

import java.security.Principal;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import icia.project.gabom.dao.ITripplanDao;
import icia.project.gabom.dao.IhouseDao;
import icia.project.gabom.dto.ChattingInfinite;
import icia.project.gabom.dto.ChattingSomoim;
import icia.project.gabom.dto.ChattingTrip;
import icia.project.gabom.dto.Food;
import icia.project.gabom.dto.House;
import icia.project.gabom.dto.House_reple;
import icia.project.gabom.dto.House_review;
import icia.project.gabom.dto.Housereservation;
import icia.project.gabom.dto.Member;
import icia.project.gabom.dto.Sns_friend;
import icia.project.gabom.dto.TripPlanDay;
import icia.project.gabom.dto.TripPlanDetail;
import icia.project.gabom.dto.Trip_member;
import icia.project.gabom.dto.Trip_plan;
import icia.project.gabom.dto.Trip_plan_date;

@Service
public class TripService {
   private ModelAndView mav;
   
   @Autowired
   private ITripplanDao tpDao;
   private IhouseDao hDao;
   
   //여행 플랜 1단계
   public String savetripplan(Trip_plan tp, Principal ppl) throws ParseException {
      String json =null;
      System.out.println("저장하러 오니?");
      String DATE_PATTERN = "yyyy-MM-dd";//날짜 패턴 선언
      
      String trip_id = ppl.getName();
      String trip_title = tp.getTrip_title();
      String trip_start_date = tp.getTrip_start_date();
      String trip_end_date = tp.getTrip_end_date();
      String trip_area = tp.getTrip_area();
      
      Trip_plan tpl = new Trip_plan();
      
      tpl.setTrip_area(trip_area).setTrip_id(trip_id).setTrip_title(trip_title);
      tpl.setTrip_start_date(trip_start_date).setTrip_end_date(trip_end_date);
      
      int trip_number = tpDao.savetripplan(tpl);
      
      System.out.println("currval값="+tpl.getTrip_number());
      
      int trip_number2=tpl.getTrip_number();
      System.out.println("여행번호:"+trip_number2);
      
       SimpleDateFormat sdf = new SimpleDateFormat(DATE_PATTERN); //날짜 패턴 형식으로 변환
        
       Date startDate = sdf.parse(trip_start_date);//시작날짜
        
       Date endDate = sdf.parse(trip_end_date);//종료날짜
        
       ArrayList<String> day = new ArrayList<String>();//날짜를 리스트에 담음

       Date currentDate = startDate;//날짜 current

        while (currentDate.compareTo(endDate) <= 0) {
           day.add(sdf.format(currentDate));
               Calendar c = Calendar.getInstance();
               c.setTime(currentDate);
               c.add(Calendar.DAY_OF_MONTH, 1);
               currentDate = c.getTime();
           }
           int index=1;
           for (String date : day) {
               System.out.println(date);
            boolean d = tpDao.savetripdate(trip_number2,date,index);
            index++;
           }
           
           System.out.println("여행 날짜 전부"+day);

      json = new Gson().toJson(tpl);
      
      return json;
   }


   //내 여행 목록 
   public ModelAndView myplan(Principal ppl,Trip_member tm) {
      String json = null;
      String json2 = null;
      String json3 = null;
      String json4 = null;
      String json5 = null;
      
      mav = new ModelAndView();
      String view = null;
      
      String trip_id = ppl.getName();
      
      
      List<Trip_plan> myplanlist = tpDao.getmyplan(trip_id);//내 여행목록
      
      List<Member> memberinfo = tpDao.getmemberinfo(trip_id);//회원정보
      List<Sns_friend> friendlist = tpDao.getfriendlist(trip_id);//회원의 친구목록
      
      List<Trip_member> reqlist =tpDao.requestmember(trip_id);//친구한테 요청한 것
  	  List<Trip_member> myreqlist =tpDao.requestme(trip_id);//나한테 온 것.
  	  
      view="Trip/myplan";
      
      json = new Gson().toJson(myplanlist);
      json2 = new Gson().toJson(memberinfo);
      json3 = new Gson().toJson(friendlist);
      json4 = new Gson().toJson(reqlist);
      json5 = new Gson().toJson(myreqlist);
      
      mav.addObject("myplanlist", json); // key,value
      mav.addObject("memberinfo", json2); // key,value
      mav.addObject("friendlist", json3); // key,value
      mav.addObject("reqlist", json4); // key,value
      mav.addObject("myreqlist", json5); // key,value
      
      
      
      //System.out.println("reqlist"+json4);
      //System.out.println("myreqlist"+json5);
      
      
      mav.setViewName(view); //view에 url로 이동
      return mav;
   
   }

   //친구 초대 
   public String togetherplan(Trip_member tm, Principal ppl) {
	String json = null;
	String json2 = null;
	
	String share_id=tm.getShare_id();
	int trip_number =tm.getTrip_number();
	String trip_id = ppl.getName();
	//System.out.println(trip_id);
	
	tm.setShare_id(share_id).setTrip_number(trip_number);
	
	boolean addfriend = tpDao.togetherplan(tm);
	
	Map<String,List<Trip_member>> list = new HashMap<String, List<Trip_member>>();
	
	List<Trip_member> reqlist =tpDao.requestmember(trip_id);//친구한테 요청한 것
	//System.out.println(reqlist);
	
	List<Trip_member> myreqlist =tpDao.requestme(trip_id);//나한테 온 것.
	//System.out.println(myreqlist);
	
	list.put("reqlist", reqlist);
	list.put("myreqlist", myreqlist);
	
	json = new Gson().toJson(list);

	
	return json;
}
   //초대 승인
	public String accepttrip(Trip_member tm, Principal ppl) {
		String json = null;
		
		String share_id=ppl.getName();
		int trip_number =tm.getTrip_number();
		System.out.println(share_id + trip_number);
		
		
		boolean acc= tpDao.accepttrip(share_id,trip_number);
		
		json = new Gson().toJson(acc);
		
		return json;
}

	//초대 거절
	public String rejecttrip(Trip_member tm, Principal ppl) {
		String json = null;
		
		String share_id=ppl.getName();
		int trip_number =tm.getTrip_number();
		System.out.println(share_id + trip_number);
		
		
		boolean acc= tpDao.rejecttrip(share_id,trip_number);
		
		json = new Gson().toJson(acc);
		
		return json;

	}

	//상세 플랜 페이지 
	public ModelAndView detailplan(int trip_number,Principal ppl) {
		//System.out.println("상세 여행페이지로");
		
		mav = new ModelAndView();
		String json = null;
	    String view = null;
	    String myinfo = null;
	    
	   // 여행 날짜 만큼 뽑아오기
	    List<Trip_plan> detrip = tpDao.detailplan(trip_number);
	    json = new Gson().toJson(detrip);
	    mav.addObject("detrip", json);
	    System.out.println(json);

	   // 내 정보 뽑아 오기
	    Member mb = tpDao.myInfo(ppl.getName());
	    myinfo = new Gson().toJson(mb);
	    mav.addObject("myinfo", myinfo);
	    System.out.println(myinfo);
	    
	    // 채팅 내용 15줄 가져오기
	  //recent chat
	  	List<ChattingTrip> selectRecentChattingData = tpDao.selectRecentChattingData(trip_number);
	  	String chatData = new Gson().toJson(selectRecentChattingData);
	  	System.out.println("jsonchatData : " + chatData);
	  	mav.addObject("JsonchatData", chatData);
	  		
	  	//다음 검색할 날짜 축출하기
	  	
	  	if(selectRecentChattingData.size() != 0) {
	  		String date = selectRecentChattingData.get(0).getChatting_date();  // 검색된 친구들 중 마지막 날짜
		  	System.out.println("다음 검색 날짜 : " + date);
		  	
		  	String nextDay = tpDao.selectNextDayInfinityChattingData(trip_number,date); // 그 다음 날짜 찾기
		  	System.out.println("다음 날짜는 언제인지요?? : " + nextDay );
		  	if(nextDay==null) {
		  		nextDay="없음";
		  	}
		  	mav.addObject("nextDay", nextDay);
		    
	  	}
	  	
	  	// 첫째날 여행계획 가져오기
	  	String tripNum = Integer.toString(trip_number);
	  	List<TripPlanDetail> selectResult = tpDao.selectPlanDetail(tripNum, "1");//해당 여행번호에 , 몇번째 여행일
	    TripPlanDay tpd = new TripPlanDay();
	    tpd.setDay("1").setTripNum(tripNum).setTripData(selectResult);
	    String jsonResult = new Gson().toJson(tpd);
	  	mav.addObject("firstDayPlan", jsonResult);
	  	
	  	
	  	
	    view="Trip/detailplan";
	    
	    mav.setViewName(view);
		return mav;
	}


	public String insertchatting(String id, String msg, int tripNum) {
		int result = tpDao.insertchatting(id,msg,tripNum);
		System.out.println("채팅 db 성공여부: " + result);
		return null;
	}


	public String selectDateChatting(String date, int tripNum) {
		
		
		List<ChattingTrip> selectInfinityChattingData = tpDao.selectInfinityChattingData(tripNum,date);
		
		String nextDay = tpDao.selectNextDayInfinityChattingData(tripNum,date);
		System.out.println("다음 날짜는 언제인지요?? : " + nextDay );
		
		
		
		ChattingInfinite ci = new ChattingInfinite();
		ci.setDate(nextDay).setChattingtripDate(selectInfinityChattingData);
		
		System.out.println("긁혀짐?:" +ci.toString());
		
		String result = new Gson().toJson(ci);
		return result;
	}


	public String insertPlanDetail(String day, String tripNum, String tripData, Principal ppl) {
		 //1 delete 2 insert 3select
		  System.out.println("day : " +day);
	      System.out.println("tripNum : " +tripNum);
	      System.out.println("tripData : " +tripData);
	      Gson gs = new Gson();
	      ArrayList<Map<String,String>> mList= new ArrayList<Map<String,String>>();
	      
	      mList = gs.fromJson(tripData, new TypeToken<ArrayList<Map<String,String>>>() {}.getType());
	      
	      //1 delete
	      int deletePlanDetail = tpDao.deletePlanDetail(tripNum,day);
	      
	      //2 insert
	      int tripOrder = 0;
	      for(Map<String,String> v : mList) {
	    	  TripPlanDetail tpd =  new TripPlanDetail();
	    	  tpd.setTrip_date(day).setTrip_number(tripNum);
	    	  tpd.setTrip_destination(v.get("trip_destination"));
	    	  tpd.setTrip_img(v.get("trip_img"));
	    	  tpd.setTrip_title(v.get("trip_title"));
	    	  tpd.setTrip_xpoint(v.get("trip_xpoint"));
	    	  tpd.setTrip_ypoint(v.get("trip_ypoint"));
	    	  tpd.setTrip_order(tripOrder);
	    	  int insertResult = tpDao.insertPlanDetail(tpd);
	    	  tripOrder++;
	      }
	      //3 select
	      List<TripPlanDetail> selectResult = tpDao.selectPlanDetail(tripNum, day);//해당 여행번호에 , 몇번째 여행일
		  
	      TripPlanDay tpd = new TripPlanDay();
	      tpd.setDay(day).setTripNum(tripNum).setTripData(selectResult);
	      
	      String jsonResult = new Gson().toJson(tpd);
	      
		return jsonResult;
	}


	public String selectMovePlanDay(String day, String tripNum, Principal ppl) {
		 List<TripPlanDetail> selectResult = tpDao.selectPlanDetail(tripNum, day);//해당 여행번호에 , 몇번째 여행일
		  
	     TripPlanDay tpd = new TripPlanDay();
	     tpd.setDay(day).setTripNum(tripNum).setTripData(selectResult);
	      
	     String jsonResult = new Gson().toJson(tpd);
		return jsonResult;
	}


	public ModelAndView triphouse(int trip_number, String areaCode, Principal ppl, int currentPlanDay) {
		mav = new ModelAndView();
		String json = null;
		String json2 = null;
	    String view = null;
	    
	    System.out.println("여행지역"+areaCode);
	    
	    List<House> trip_houselist = tpDao.triphouse(areaCode);// 여행지역만 가지고 검색 가능 
	    
	    List<Trip_plan> tripinfo = tpDao.tripinfo(trip_number,currentPlanDay);
	    
	    json = new Gson().toJson(trip_houselist);
	    json2 = new Gson().toJson(tripinfo);
	    System.out.println(json);
	    mav.addObject("trip_houselist", json);
	    mav.addObject("tripinfo", json2);
	    
	    view="Trip/trip_houseSearchDetail";
	    
	    mav.setViewName(view);
		return mav;
	}


	public ModelAndView triphousedetail(int house_number, Housereservation reserlist, Principal ppl, Trip_plan_date td) {
		mav = new ModelAndView();
		String view = null;
		String json = null;
		String json2 = null;
		String json3= null;
		String json4= null;
		String json5= null;
		String json6= null;// 맵으로 했다가 까기 힘들어서 그냥 따로함
		
		String member_id=ppl.getName();
		int trip_number = td.getTrip_number();
		int trip_day = td.getTrip_day();
		
		List<House> detailhouse = tpDao.detailhouse(house_number);
		
		List<Housereservation> detailreser = tpDao.detailreser(house_number);
		
		List<House_reple> reple_list = tpDao.replelist(house_number);
		
		List<House_review> review_list =tpDao.reviewlist(house_number);
		
		List<Member> memberinfo=tpDao.memberinfo(member_id);
		
		List<Trip_plan> tripinfo = tpDao.tripinfo(trip_number,trip_day);
		
		
		json = new Gson().toJson(detailhouse);
		json2 = new Gson().toJson(detailreser);
		json3 = new Gson().toJson(reple_list);
		json4 = new Gson().toJson(review_list);
		json5 = new Gson().toJson(memberinfo);
		json6 = new Gson().toJson(tripinfo);
		
		mav.addObject("detailhouse",json);
		mav.addObject("detailreser",json2);
		mav.addObject("reple_list",json3);
		mav.addObject("review_list",json4);
		mav.addObject("memberinfo",json5);
		mav.addObject("tripinfo",json6);

		
		view="Trip/trip_housedetail";

	    mav.setViewName(view);
		return mav;
	}


	public String tripreservation(Principal principal, Housereservation hreservation, Trip_plan_date td) {
		String json = null;
	    
	    String member_guestid=principal.getName();
		int house_number= hreservation.getHouse_number();
		String house_hostid= hreservation.getHouse_hostid();
		int reservation_totalprice=hreservation.getReservation_totalprice();
		int reservation_person=hreservation.getReservation_person();
		String reservation_checkin=hreservation.getReservation_checkin();
		String reservation_checkout=hreservation.getReservation_checkout();		
		
		hreservation.setHouse_hostid(house_hostid).setHouse_number(house_number).setMember_guestid(member_guestid);
		hreservation.setReservation_checkin(reservation_checkin).setReservation_checkout(reservation_checkout);
		hreservation.setReservation_person(reservation_person).setReservation_totalprice(reservation_totalprice);
		
		int reservation_number = tpDao.housereservation(hreservation); // 예약 하고 
		
		System.out.println("currval값="+hreservation.getReservation_number());//예약번호 받고 
	      
	    int resernum=hreservation.getReservation_number();
	    System.out.println("예약번호 :"+resernum);
	    
	    int trip_number = td.getTrip_number();
		int trip_day = td.getTrip_day();
	    	
	    tpDao.t_dateup(resernum,trip_number,trip_day);//예약번호 day에 입력 

		return json;
	}
   
   

}