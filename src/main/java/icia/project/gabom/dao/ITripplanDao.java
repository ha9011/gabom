package icia.project.gabom.dao;

import java.security.Principal;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import icia.project.gabom.dto.Member;
import icia.project.gabom.dto.Sns_friend;
import icia.project.gabom.dto.Trip_member;
import icia.project.gabom.dto.Trip_plan;

public interface ITripplanDao {
   
   
   int savetripplan(Trip_plan tpl);
   
   
   boolean savetripdate(@Param("trip_number2")int trip_number2,@Param("date")String date, @Param("index")int index);

   @Select("SELECT * FROM TRIP_PLAN WHERE TRIP_ID=#{trip_id}")
   List<Trip_plan> getmyplan(String trip_id);
   
   @Select("SELECT * FROM MEMBER WHERE MEMBER_ID=#{trip_id}")
   List<Member> getmemberinfo(String trip_id);
   
   @Select("SELECT * FROM SNS_FRIEND WHERE FRIEND_MY_ID=#{trip_id} AND FRIEND_STATUS=2")
   List<Sns_friend> getfriendlist(String trip_id);

   
   boolean togetherplan(Trip_member tm);

   @Select("select TP.TRIP_TITLE, TP.TRIP_ID, TM.SHARE_ID, TM.TRIP_TYPE from TRIP_PLAN TP, TRIP_MEMBER TM where TP.TRIP_NUMBER=TM.TRIP_NUMBER AND TRIP_ID=#{trip_id} AND TM.TRIP_TYPE=0")
   List<Trip_member> requestmember(String trip_id);

   @Select("select TP.TRIP_TITLE, TP.TRIP_ID, TM.SHARE_ID, TM.TRIP_TYPE,TP.TRIP_NUMBER from TRIP_PLAN TP, TRIP_MEMBER TM where TP.TRIP_NUMBER=TM.TRIP_NUMBER AND SHARE_ID=#{trip_id} AND TM.TRIP_TYPE=0")
   List<Trip_member> requestme(String trip_id);

}