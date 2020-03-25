package icia.project.gabom.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import icia.project.gabom.dto.Food_review;
import icia.project.gabom.dto.Foodreservation;
import icia.project.gabom.dto.House_review;
import icia.project.gabom.dto.Housereservation;
import icia.project.gabom.dto.Member;

public interface IMyInfoDao {
  //MYINFOMAPPER 참고!!
	
	
	Member selectshowMyInfo(@Param("name") String name);

	int restChargeMoney(@Param("chargeMoney")String chargeMoney,@Param("name") String name);

	List<Housereservation> getmyreser(@Param("member_guestid")String member_guestid);

	List<Foodreservation> getmyfreser(@Param("member_guestid")String member_guestid);

	@Delete("DELETE FROM HOUSERESERVATION WHERE RESERVATION_NUMBER=#{reservation_number}")
	void deletehreser(int reservation_number);

	@Delete("DELETE FROM FOODRESERVATION WHERE FOODRESERVATION_NUMBER=#{foodreservation_number}")
	void deletefreser(int foodreservation_number);

	List<Housereservation> getreviewmyreser(@Param("member_guestid")String member_guestid);

	List<Foodreservation> getreviewmyfreser(@Param("member_guestid")String member_guestid);

	void inserthreview(House_review hrv);

	@Insert("INSERT INTO HOUSE_REVIEW_IMAGE VALUES(#{house_review_number},#{house_review_orifile},#{house_review_sysfile})")
	boolean housereviewimage(Map<String, String> fMap);

	List<House_review> getmyhrevie(@Param("member_guestid")String member_guestid);

	List<House_review> showhreview(@Param("house_review_number")int house_review_number);

	@Update("UPDATE HOUSERESERVATION SET HOUSE_REVIEW_STATUS=1 WHERE RESERVATION_NUMBER=#{reservation_number}")
	void updatereser(@Param("reservation_number")int reservation_number);

	@Insert("INSERT INTO FOOD_REVIEW_IMAGE VALUES(#{food_review_number},#{food_review_orifile},#{food_review_sysfile})")
	boolean foodreviewimage(Map<String, String> fMap);

	void insertfreview(Food_review frv);

	@Update("UPDATE FOODRESERVATION SET FOOD_REVIEW_STATUS=1 WHERE FOODRESERVATION_NUMBER=#{foodreservation_number}")
	void updatefreser(@Param("foodreservation_number")int foodreservation_number);

	
	List<Food_review> getmyfrevie(@Param("member_guestid")String member_guestid);


	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
	
}
