package icia.project.gabom;

import java.security.Principal;
import java.text.ParseException;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import icia.project.gabom.dao.ITripplanDao;
import icia.project.gabom.dto.Sns_friend;
import icia.project.gabom.dto.Trip_member;
import icia.project.gabom.dto.Trip_plan;
import icia.project.gabom.service.TripService;

@RestController
@RequestMapping(value = "/tprest")
public class TripRestController {
   
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
   
   
}