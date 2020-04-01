package icia.project.gabom.dao;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import icia.project.gabom.dto.ChattingSomoim;
import icia.project.gabom.dto.ChattingTrip;
import icia.project.gabom.dto.House;
import icia.project.gabom.dto.House_reple;
import icia.project.gabom.dto.House_review;
import icia.project.gabom.dto.Housereservation;
import icia.project.gabom.dto.Member;
import icia.project.gabom.dto.ReservationPlanHouse;
import icia.project.gabom.dto.Sns_friend;
import icia.project.gabom.dto.TripPlanDetail;
import icia.project.gabom.dto.Trip_member;
import icia.project.gabom.dto.Trip_plan;
import icia.project.gabom.dto.Trip_plan_date;
import icia.project.gabom.dto.Tripmemoupdate;

public interface ITripplanDao {
   
   
   int savetripplan(Trip_plan tpl);
   
   
   boolean savetripdate(@Param("trip_number2")int trip_number2,@Param("date")String date, @Param("index")int index);

   List<Trip_plan> getmyplan(String trip_id);
   
   @Select("SELECT * FROM MEMBER WHERE MEMBER_ID=#{trip_id}")
   List<Member> getmemberinfo(String trip_id);
   
   @Select("SELECT * FROM SNS_FRIEND WHERE FRIEND_MY_ID=#{trip_id} AND FRIEND_STATUS=2")
   List<Sns_friend> getfriendlist(String trip_id);

   
   boolean togetherplan(Trip_member tm);

   List<Trip_member> requestmember(@Param("trip_id")String trip_id);

   List<Trip_member> requestme(@Param("trip_id")String trip_id);
   
   @Update("UPDATE TRIP_MEMBER SET TRIP_TYPE= 1 WHERE TRIP_NUMBER=#{trip_number} AND SHARE_ID=#{share_id}")
   boolean accepttrip(@Param("share_id")String share_id,@Param("trip_number")int trip_number);
   
   @Update("UPDATE TRIP_MEMBER SET TRIP_TYPE= 2 WHERE TRIP_NUMBER=#{trip_number} AND SHARE_ID=#{share_id}")
   boolean rejecttrip(@Param("share_id")String share_id,@Param("trip_number")int trip_number);

   List<Trip_plan> detailplan(@Param("trip_number")int trip_number);

   List<House> triphouse(@Param("areaCode")String areaCode);

   @Select("select * from registhouse r, housefile HF WHERE R.HOUSE_NUMBER = HF.HOUSE_NUMBER AND R.HOUSE_NUMBER=#{house_number}")
   List<House> detailhouse(int house_number);

   @Select("select * from HOUSERESERVATION WHERE HOUSE_NUMBER=#{house_number} order by RESERVATION_CHECKIN")
   List<Housereservation> detailreser(int house_number);
   
   @Select("SELECT * FROM HOUSEREPLE WHERE HOUSE_NUMBER=#{house_number} ORDER BY HOUSE_REPLE_TIME DESC" )
   List<House_reple> replelist(int house_number);
   
   @Select("SELECT * FROM HOUSE_REVIEW HR WHERE HOUSE_NUMBER=#{house_number}")
   List<House_review> reviewlist(int house_number);
   
   @Select("SELECT * FROM MEMBER WHERE MEMBER_ID=#{member_id}")
   List<Member> memberinfo(@Param("member_id")String member_id);

   int housereservation(Housereservation hreservation);
   
   @Update("update trip_plan_DATE set reservation_number =#{resernum} where trip_number =#{trip_number} and TRIP_DAY=#{trip_day}")
   void t_dateup(@Param("resernum")int resernum,@Param("trip_number")int trip_number,@Param("trip_day")int trip_day); 
   
   //하동원 ===================================
   @Select("SELECT MEMBER_ID,MEMBER_PROFILE_PICTURE FROM MEMBER WHERE MEMBER_ID = #{name} ")
   Member myInfo(@Param("name")String name);

   @Insert("insert into trip_chatting values(#{tripNum}, #{id},  sysdate, #{msg}) ")
   int insertchatting(@Param("id")String id, @Param("msg")String msg, @Param("tripNum")int tripNum);


   List<ChattingTrip> selectRecentChattingData(@Param("trip_number")int trip_number);

   String selectNextDayInfinityChattingData(@Param("trip_number")int trip_number, @Param("date")String date);

   List<ChattingTrip> selectInfinityChattingData(@Param("trip_number")int tripNum, @Param("date")String date);


   int insertPlanDetail(TripPlanDetail tpd);
   
   @Select("SELECT * FROM TRIP_PLAN_DETAIL WHERE TRIP_NUMBER = #{tripNum} and TRIP_DATE = #{day} order by TRIP_ORDER asc ")
   List<TripPlanDetail> selectPlanDetail(@Param("tripNum")String tripNum, @Param("day")String day);

   @Delete("DELETE FROM TRIP_PLAN_DETAIL WHERE TRIP_NUMBER = #{tripNum} and TRIP_DATE = #{day} ")
   int deletePlanDetail(@Param("tripNum")String tripNum, @Param("day")String day);
   
   @Select("SELECT * from trip_plan_DATE where trip_number=#{trip_number} AND TRIP_DAY=#{currentPlanDay}")
   List<Trip_plan> tripinfo(@Param("trip_number")int trip_number, @Param("currentPlanDay")int currentPlanDay);

   ReservationPlanHouse selectReservationHouse(@Param("tripNum")String tripNum, @Param("day")String day);
   
   
   
   @Select("select house_address, house_xpoint,house_ypoint, house_name, hf.HOUSE_SYSNAME  from RegistHouse rh , housefile hf where rh.HOUSE_NUMBER = hf.HOUSE_NUMBER  and rh. house_number = #{house_number} and hf.HOUSE_IMAGETYPE = 1")
   House houseInfo(@Param("house_number")int house_number); 

   @Select("select MAX(TRIP_ORDER) from TRIP_PLAN_DETAIL where trip_date = #{day} and trip_number= #{tripNum}  order by trip_date, trip_order")
   Integer selecTripNextPlan(@Param("tripNum")int trip_number, @Param("day")int trip_day);
   
   int insertHousePlanDetail(@Param("tripNum")int trip_number, @Param("day")int trip_day, @Param("nextplan")Integer tripNextPlan, @Param("HouseInfo")House selectHouseInfo);


   int updatetripmemo(Tripmemoupdate tripup);

   @Select("select trip_memo from trip_plan_detail where trip_number = #{trip_number} and trip_date = #{trip_date} and trip_order = #{trip_order}")
   String selecttripmemo(Tripmemoupdate tripup);

   @Insert("insert into trip_plan_recommand values(#{tripPlanNum}, 1)") //1번은 대기
   int insertTripPlanApply(@Param("tripPlanNum")int tripPlanNum);

   
   @Delete("DELETE FROM trip_plan_recommand WHERE TRIP_NUMBER = #{tripPlanNum} ")
   int deleteTripPlanApply(@Param("tripPlanNum")int tripPlanNum);

   
//   @Select("select trip_number,trip_date,trip_destination,trip_memo,trip_title,trip_order from trip_plan_detail where trip_number = #{trip_number} and trip_date = #{trip_date} and trip_order = #{trip_order} and trip_title = #{trip_title}")
//   String selecttripmemo(Tripmemoupdate tripup);

   






}