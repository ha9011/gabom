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
import org.springframework.transaction.annotation.Transactional;
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
import icia.project.gabom.dto.ReservationPlanHouse;
import icia.project.gabom.dto.Sns_friend;
import icia.project.gabom.dto.TripPlanDay;
import icia.project.gabom.dto.TripPlanDetail;
import icia.project.gabom.dto.Trip_member;
import icia.project.gabom.dto.Trip_plan;
import icia.project.gabom.dto.Trip_plan_date;
import icia.project.gabom.dto.Tripmemoupdate;

@Service
public class TripService {
   private ModelAndView mav;
   
   @Autowired
   private ITripplanDao tpDao;
 
   
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
	  
	  	//첫쨋날 숙소 가져오기
	  	ReservationPlanHouse selectReservationHouse = tpDao.selectReservationHouse(tripNum, "1");//해당 여행번호에 , 몇번째 여행일
	    
	    String jsonReservationHouse = new Gson().toJson(selectReservationHouse);
	    System.out.println("ReservationHouse : " + jsonReservationHouse);
	  	mav.addObject("ReservationHouse", jsonReservationHouse);
	  	
	  	// 숙소 예약했는지 파악 - 단순 공유인지 확인하기 위해 추가함;
	  	List<Map<String,Integer>> HouseReserCheck = tpDao.selectHouseReserCheck(tripNum);//해당 여행번호에 , 몇번째 여행일
	    String jsonHouseReserCheck = new Gson().toJson(HouseReserCheck);
	    System.out.println("HouseReserCheck : " + jsonHouseReserCheck);
	  	mav.addObject("HouseReserCheck", jsonHouseReserCheck);
	  	
	  	
	  	
	    view="Trip/detailplan";
	    mav.setViewName(view);
		return mav;
	}


	public String insertchatting(String id, String msg, int tripNum,String date) {
		int result = tpDao.insertchatting(id,msg,tripNum,date);
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
	    	  tpd.setTrip_type(Integer.parseInt(v.get("trip_type")));
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
		
//		System.out.println("여행일수 "+td.getTrip_day());
//		System.out.println("여행번호"+td.getTrip_number());
		
		hreservation.setHouse_hostid(house_hostid).setHouse_number(house_number).setMember_guestid(member_guestid);
		hreservation.setReservation_checkin(reservation_checkin).setReservation_checkout(reservation_checkout);
		hreservation.setReservation_person(reservation_person).setReservation_totalprice(reservation_totalprice);
		
		int reservation_number = tpDao.housereservation(hreservation); // 예약 하고  // 인서트
		
		System.out.println("currval값="+hreservation.getReservation_number());//예약번호 받고  
	      
	    int resernum=hreservation.getReservation_number();
	    System.out.println("예약번호 :"+resernum);
	    
	    int trip_number = td.getTrip_number();  // 여행 번호
		int trip_day = td.getTrip_day(); // 몇번째 여행인지.
	    
		 
	    tpDao.t_dateup(resernum,trip_number,trip_day);//예약번호 day에 입력   //업데이트
	    
	    
	    House selectHouseInfo = tpDao.houseInfo(house_number);//집정보가져오고,
		System.out.println("gg : " + selectHouseInfo.toString());
	    
	    Integer TripNextPlan = tpDao.selecTripNextPlan(trip_number,trip_day); // max 값에 +1 하면 됨
		int HousePlanDetail ;
		if(TripNextPlan==null) {  // 0
			HousePlanDetail = tpDao.insertHousePlanDetail(trip_number,trip_day,0,selectHouseInfo); // 여행계획에 넣고 insert
		}else { // 
			HousePlanDetail = tpDao.insertHousePlanDetail(trip_number,trip_day,(TripNextPlan+1),selectHouseInfo); // 여행계획에 넣고 insert
		}
	    
		return json;
	}
	public String selecttripmemo(Tripmemoupdate tripup) {
		System.out.println("메모셀렉 서비스");
		String json = tpDao.selecttripmemo(tripup); 
		System.out.println("셀렉한 메모="+json);
		return json;
	}

	public String updatetripmemo(Tripmemoupdate tripup) {
		
		String trip_number = tripup.getTrip_number();
		String trip_date = tripup.getTrip_date();
		String trip_order = tripup.getTrip_order();
		String trip_title = tripup.getTrip_title();
		String trip_memo = tripup.getTrip_memo();
		
		System.out.println("서비스="+trip_number);
		System.out.println("서비스="+trip_date);
		System.out.println("서비스="+trip_order);
		System.out.println("서비스="+trip_title);
		System.out.println("서비스="+trip_memo);
		System.out.println("서비스에서 dao로 이동");
		int memoupdate = tpDao.updatetripmemo(tripup);
		System.out.println("메모 업데이트 성공");
		return null;
	}


	public String TripPlanApply(int tripPlanNum, int tripPlanStatus, String name) {
		if(tripPlanStatus==0) {  // 신청하기
			int memoupdate = tpDao.insertTripPlanApply(tripPlanNum);
			System.out.println("신청 성공했는가? : " +  memoupdate);
		}else if(tripPlanStatus==1) { //신청한거 취소하기
			int memoupdate = tpDao.deleteTripPlanApply(tripPlanNum);
			System.out.println("신청한거 취소했는가? : " +  memoupdate);
		}else if(tripPlanStatus==2) { // 신청성공한거 취소하기
			int memoupdate = tpDao.deleteTripPlanApply(tripPlanNum);
			System.out.println("신청성공한거 취소했는가? : " +  memoupdate);
		}
		
		//int memoupdate = tpDao.insertTripPlanApply(tripPlanNum);
		List<Trip_plan> myplanlist = tpDao.getmyplan(name);//내 여행목록
		
		String json = new Gson().toJson(myplanlist);
		
		return json;
	}
	
	public String searchtrippaln(String trip_area) {//여행지역 검색
		String json =null;
			
		System.out.println(trip_area);
		List<Trip_plan> trlist = tpDao.searchtrippaln(trip_area);
		
		json = new Gson().toJson(trlist);
		return json;
	}






	public String getplan(int trip_number) {
		String json = null;
		
		//List<Trip_plan> detrip = tpDao.detailplan(trip_number);// 여행관련 정보 다 퍼옴  1일,2일,3일,4일
	    
	    // for문 몇번 돌려야하는지 카운터 찾아야함.
	    int countTripDay = tpDao.selectCountTripDay(trip_number);
	    System.out.println("countTripDay : " + countTripDay);  // 제대로 나옴
	    
	    Map<Integer, List<TripPlanDetail>> resultMap = new HashMap<Integer, List<TripPlanDetail>>();
	    for(int i = 1; i <= countTripDay; i++) {
	    	List<TripPlanDetail> selectResult = tpDao.selectPlanDetail(Integer.toString(trip_number), Integer.toString(i));
	    	resultMap.put(i, selectResult);
	    }
	    
	    json = new Gson().toJson(resultMap);
	    System.out.println("resultMap : "+json);
		return json;
	}

	@Transactional
	public String insertSharePlan(String[] rangedate, int tripnum, String name) {
		// 
		//공유할 친구의 데이터 가져오기
		//1. 데이터 삽입 TRIP_TABLE
		Trip_plan tp = tpDao.selectShareTripPlan(tripnum);
		tp.setTrip_id(name).setTrip_start_date(rangedate[0]).setTrip_end_date(rangedate[rangedate.length-1]);
		System.out.println("share할 plan data : " + tp.toString());
		int resultShare = tpDao.insertShareTripPlan(tp);
		System.out.println("currval값="+tp.getTrip_number());
		System.out.println("resultShare 성공 : " + resultShare);
		
		//1-1 여행 공유 카운터에 +1 하기  tripnum 여행번호
		int resultShareCount = tpDao.updateShareCountTripPlan(tripnum);
		
		//2.몇번째 여행까지 있는지 삽입   // 포문 없이 하는 법을 나중에 깨달았다..................
		int Ndate = 1;
		for(String date : rangedate) {
			System.out.println("date : " + date + " 몇번여행  : " + tp.getTrip_number() + " 몇번째 : " + Ndate );
			int tripplandate = tpDao.insertShareTripPlanDate(date,tp.getTrip_number(),Ndate);
			Ndate++;
			System.out.println("tripplandate 성공 : " + tripplandate);
		}
		
		//3.모든 여행 계획 넣기  //
		int detailplandate = tpDao.insertShareTripPlanDetail(tp.getTrip_number(),tripnum);  // 새로운번호, 공유번호
		System.out.println("detailplandate 성공 : " + detailplandate);
		return null;
	}

	@Transactional
	public String cancelReservation(int tripNum, int currentPlanDay, int resernumber, int dbnum) {
		
		// 숙소 번호 없는 걸로 바꾸기
		int updateTripPlanDate = tpDao.updateTripPlanDate(tripNum,currentPlanDay,resernumber); 
		// 디테일에서 삭제하기
		int deleteTripPlanDatail = tpDao.deleteTripPlanDatail(tripNum,currentPlanDay,resernumber,dbnum); 
		// 예약번호 지우기
		int deleteHouseReservation = tpDao.deleteHouseReservation(resernumber); 

		// 숙소 예약했는지 파악 - 단순 공유인지 확인하기 위해 추가함;
	  	List<Map<String,Integer>> HouseReserCheck = tpDao.selectHouseReserCheck(Integer.toString(tripNum));//해당 여행번호에 , 몇번째 여행일
	    String jsonHouseReserCheck = new Gson().toJson(HouseReserCheck);
	    System.out.println("HouseReserCheck : " + jsonHouseReserCheck);
	  	
		return jsonHouseReserCheck;
	}


	public String addPlanDate(int tripnumber, String addDate, int nDate) {
		
		//1.TRip_Plan 여행막날 수정
			int updateTripPlanEndDay = tpDao.updateTripPlanEndDay(tripnumber,addDate); 
		//2.Trip_Plan_Date 추가하기
			int insertAddTripPlanNDay = tpDao.insertAddTripPlanNDay(tripnumber,addDate,nDate); 
		//3.select 하기
			
			Map<String,String> result = new HashMap<String, String>();
			List<Trip_plan> detrip = tpDao.detailplan(tripnumber);
		    String jsonDetrip = new Gson().toJson(detrip);
		    
		    List<Map<String,Integer>> HouseReserCheck = tpDao.selectHouseReserCheck(Integer.toString(tripnumber));//해당 여행번호에 , 몇번째 여행일
		    String jsonHouseReserCheck = new Gson().toJson(HouseReserCheck);
		    
		    result.put("detail", jsonDetrip);
		    result.put("HouseReserCheck", jsonHouseReserCheck);
		    
		    
		return new Gson().toJson(result);
	}


	public String delePlanDate(int tripnumber, String deleDate, int nDate, int currentDay, String endDate) {
		// tripnumber : 여행 고유번호 // deleDate : 제일 마지막 날짜에서 -1 // nDate : 총 몇개가 있는지 // currentDay : 현재 몇번째날 지웠는지  
		
		
		//1.TRip_Plan 여행막날 수정
		int updateTripPlanEndDay = tpDao.updateTripPlanEndDay(tripnumber,endDate);   // 성공
		System.out.println("여행막날 수정 성공했니? : " + updateTripPlanEndDay);
		//2.Trip_Plan_Date 삭제하기
		int deleteTripPlanNDay = tpDao.deleteTripPlanNDay(tripnumber,currentDay); 
		System.out.println("여행 n번째 삭제 성공했니? : " + deleteTripPlanNDay);
		//2-1.한칸씩 떙기기 앞으로
		int updateTripPlanNDay = tpDao.updateTripPlanNDay(tripnumber,currentDay); 
		System.out.println("여행 n번째 1칸씩 떙겨오기? : " + deleteTripPlanNDay);
		
		//3 삭제 하기 
		int deleteTripPlanDetailNDay = tpDao.deleteTripPlanDetailNDay(tripnumber,currentDay);
		System.out.println("여행 디테일 n번째 이후로 삭제 성공했니? : " + deleteTripPlanDetailNDay);
		//3-1 한칸씩 떙기기
		int updateTripPlanDetailNDay = tpDao.updateTripPlanDetailNDay(tripnumber,currentDay);
		System.out.println("여행 디테일 n번번째 날짜 떙겨오니? : " + updateTripPlanDetailNDay);
		
		
		Map<String,String> result = new HashMap<String, String>();
		List<Trip_plan> detrip = tpDao.detailplan(tripnumber);  // 디테일 여행 가져오기
	    String jsonDetrip = new Gson().toJson(detrip);
	    
	    List<Map<String,Integer>> HouseReserCheck = tpDao.selectHouseReserCheck(Integer.toString(tripnumber));//해당 여행번호에 , 몇번째 여행일
	    String jsonHouseReserCheck = new Gson().toJson(HouseReserCheck);
	    
	    // 위에서 1개씩 밀려왔으니 그냥 current 쓰면 됨
	    List<TripPlanDetail> selectResult = tpDao.selectPlanDetail(Integer.toString(tripnumber), Integer.toString(currentDay));//해당 여행번호에 , 몇번째 여행일
	    TripPlanDay tpd = new TripPlanDay();
	    tpd.setDay(Integer.toString(currentDay)).setTripNum(Integer.toString(tripnumber)).setTripData(selectResult);
	    
	    String deleToNext = new Gson().toJson(tpd);
	    
	    result.put("detail", jsonDetrip);
	    result.put("HouseReserCheck", jsonHouseReserCheck);
	    result.put("deleToNext", deleToNext);
		
	    System.out.println("detail :"+ jsonDetrip);
	    System.out.println("jsonHouseReserCheck "+ jsonHouseReserCheck);
	    System.out.println("deleToNext : "+ deleToNext);
	    
		return new Gson().toJson(result);
	}


	public String changeDay(int tripNumber, String newStartDayDB, String newLastDayDB, int rangeDay,
		int diffOriNewFirstday,  String changeTripTitle,String trip_id) {
		
		//1. trip_plan 날짜 변경
		int updateTripDay = tpDao.updateTripDay(tripNumber,changeTripTitle,newStartDayDB,newLastDayDB);
		
		//2. trip_plan_date 날짜 변경
		int updateTripDate = tpDao.updateTripDate(tripNumber,diffOriNewFirstday);
		
		List<Trip_plan> myplanlist = tpDao.getmyplan(trip_id);
		
		
		return new Gson().toJson(myplanlist);
	}


	public String deleteTripPlan(int tripnumber) {

		//1.TRIP_PLAN 삭제
		int deleteTripPlan = tpDao.deleteTripPlan(tripnumber);
		//2 TRIP_PLAN_DATE 삭제
		int deleteTripPlanDate = tpDao.deleteTripPlanDate(tripnumber);
		//3 TRIP_PLAN_DETAIL 삭제
		int deleteTripPlanDetail = tpDao.deleteTripPlanDetail(tripnumber);
		//4 trip_plan_recommand 삭제
		int deleteTripPlanReco = tpDao.deleteTripPlanReco(tripnumber);
		//5 TRIP_MEMBER 삭제
		int deleteTripMember = tpDao.deleteTripMember(tripnumber);
		
		return null;
	}

	
	  //home에서 여행계획들 불러옴 
	public String getplanlist() {
		String json = null;
		
		List<Trip_plan> tplist = tpDao.gettplist();
		
		json = new Gson().toJson(tplist);
	 
		return json; 
	 }


	public String delePlanDateLast(int tripnumber, String deleDate, int nDate, int currentDay, String endDate) {
		// tripnumber : 여행 고유번호 // deleDate : 제일 마지막 날짜에서 -1 // nDate : 총 몇개가 있는지 // currentDay : 현재 몇번째날 지웠는지  
		
		//마지막 날짜니 그냥 삭제 떙겨올필요없음
				//1.TRip_Plan 여행막날 수정
				int updateTripPlanEndDay = tpDao.updateTripPlanEndDay(tripnumber,endDate);   // 성공
				System.out.println("여행막날 수정 성공했니? : " + updateTripPlanEndDay);
				//2.Trip_Plan_Date 삭제하기
				int deleteTripPlanNDay = tpDao.deleteTripPlanNDay(tripnumber,currentDay); 
				System.out.println("여행 n번째 삭제 성공했니? : " + deleteTripPlanNDay);
				//3 삭제 하기 
				int deleteTripPlanDetailNDay = tpDao.deleteTripPlanDetailNDay(tripnumber,currentDay);
				System.out.println("여행 디테일 n번째 이후로 삭제 성공했니? : " + deleteTripPlanDetailNDay);
				
				
				
				Map<String,String> result = new HashMap<String, String>();
				List<Trip_plan> detrip = tpDao.detailplan(tripnumber);  // 디테일 여행 가져오기
			    String jsonDetrip = new Gson().toJson(detrip);
			    
			    List<Map<String,Integer>> HouseReserCheck = tpDao.selectHouseReserCheck(Integer.toString(tripnumber));//해당 여행번호에 , 몇번째 여행일
			    String jsonHouseReserCheck = new Gson().toJson(HouseReserCheck);
			    
			    // 마지막 날짜니깐 앞에거 부르면 됨 그래서 current-1
			    List<TripPlanDetail> selectResult = tpDao.selectPlanDetail(Integer.toString(tripnumber), Integer.toString(currentDay-1));//해당 여행번호에 , 몇번째 여행일
			    TripPlanDay tpd = new TripPlanDay();
			    tpd.setDay(Integer.toString(currentDay)).setTripNum(Integer.toString(tripnumber)).setTripData(selectResult);
			    
			    String deleToNext = new Gson().toJson(tpd);
			    
			    result.put("detail", jsonDetrip);
			    result.put("HouseReserCheck", jsonHouseReserCheck);
			    result.put("deleToNext", deleToNext);
				
			    System.out.println("detail :"+ jsonDetrip);
			    System.out.println("jsonHouseReserCheck "+ jsonHouseReserCheck);
			    System.out.println("deleToNext : "+ deleToNext);
			    
				return new Gson().toJson(result);
			}
	 

	
   
   

}