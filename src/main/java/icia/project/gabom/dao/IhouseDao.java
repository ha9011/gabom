package icia.project.gabom.dao;


import java.security.Principal;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import icia.project.gabom.dto.House;
import icia.project.gabom.dto.House_reple;
import icia.project.gabom.dto.House_review;
import icia.project.gabom.dto.Housereservation;
import icia.project.gabom.dto.Member;


public interface IhouseDao {
	
	int houseRegisterUpload(House house);

	@Insert("INSERT INTO HOUSEFILE VALUES(#{house_number},1,#{house_oriname},#{house_sysname})")
	boolean mainfileInsert(Map<String, String> fMap);

	@Insert("INSERT INTO HOUSEFILE VALUES(#{house_number},2,#{house_oriname},#{house_sysname})")
	boolean detailfileInsert(Map<String, String> fMap);

	@Select("SELECT * FROM registhouse R, housefile HF WHERE R.HOUSE_NUMBER = HF.HOUSE_NUMBER AND HOUSE_IMAGETYPE=1 AND HOUSE_GRANTTYPE=1")
	List<House> getHouseList();
	
	@Select("SELECT * FROM registhouse R, housefile HF WHERE R.HOUSE_NUMBER = HF.HOUSE_NUMBER AND HOUSE_ADDRESS LIKE '%'||#{house_address}||'%' AND HOUSE_IMAGETYPE=1 AND HOUSE_GRANTTYPE=1")
	List<House> searchhouse(String house_address);
	
	@Select("SELECT * FROM registhouse R, housefile HF where R.HOUSE_NUMBER = HF.HOUSE_NUMBER AND HOUSE_ADDRESS LIKE '%'||#{house_address}||'%' AND HOUSE_IMAGETYPE=1 AND HOUSE_GRANTTYPE=1")
	List<House> changesearch(String house_address);

	@Select("select * from registhouse r, housefile HF WHERE R.HOUSE_NUMBER = HF.HOUSE_NUMBER AND R.HOUSE_NUMBER=#{house_number}")
	List<House> detailhouse(int house_number);
	
	//----------------------------------------------------------------------------------------------------------예약
	int housereservation(Housereservation hreservation);
	
	@Select("select * from HOUSERESERVATION WHERE HOUSE_NUMBER=#{house_number} order by RESERVATION_CHECKIN")
	List<Housereservation> detailreser(@Param("house_number") int house_number);
	
	@Select("SELECT * FROM HOUSEREPLE WHERE HOUSE_NUMBER=#{house_number} ORDER BY HOUSE_REPLE_TIME DESC" )
	List<House_reple> replelist(int house_number);
	
	@Select("SELECT * FROM MEMBER WHERE MEMBER_ID=#{member_id}")
	List<Member> memberinfo(String member_id);

	void insertreple(House_reple hreple);
	
	List<House_review> reviewlist(int house_number);

	List<House_review> showhreview(@Param("house_review_number")int house_review_number);

	@Delete("DELETE FROM HOUSEREPLE WHERE HOUSE_REPLE_NUMBER=#{house_reple_number}")
	void repledel(@Param("house_reple_number")int house_reple_number); 
	
	
	
}
