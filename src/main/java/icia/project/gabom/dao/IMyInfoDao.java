package icia.project.gabom.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import icia.project.gabom.dto.Foodreservation;
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

	List<Housereservation> getreviewmyreser(String member_guestid);

	List<Foodreservation> getreviewmyfreser(String member_guestid);
	
}
