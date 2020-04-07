package icia.project.gabom.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import icia.project.gabom.dto.Food;
import icia.project.gabom.dto.Food_reple;
import icia.project.gabom.dto.Food_review;
import icia.project.gabom.dto.Foodreservation;
import icia.project.gabom.dto.Housereservation;
import icia.project.gabom.dto.Member;

public interface IfoodDao {

	int foodRegisterUpload(Food food);
	
	@Insert("INSERT INTO FOODFILE VALUES(#{food_number},1,#{food_oriname},#{food_sysname})")
	boolean mainfileInsert(Map<String, String> fMap);
	
	@Insert("INSERT INTO FOODFILE VALUES(#{food_number},2,#{food_oriname},#{food_sysname})")
	boolean detailfileInsert(Map<String, String> fMap);
	
	@Select("SELECT * FROM foodshop F, foodfile FF WHERE F.FOOD_NUMBER = FF.FOOD_NUMBER AND FOOD_IMAGETYPE=1 AND FOOD_GRANTTYPE=1")
	List<Food> getfoodList();

	@Select("SELECT * FROM foodshop F, foodfile FF WHERE F.FOOD_NUMBER = FF.FOOD_NUMBER AND FOOD_ADDRESS LIKE '%'||#{food_address}||'%' AND FOOD_IMAGETYPE=1 AND FOOD_GRANTTYPE=1")
	List<Food> searchfood(String food_address);
	
	@Select("SELECT * FROM foodshop F, foodfile FF WHERE F.FOOD_NUMBER = FF.FOOD_NUMBER AND FOOD_ADDRESS LIKE '%'||#{food_address}||'%' AND FOOD_IMAGETYPE=1 AND FOOD_GRANTTYPE=1")
	List<Food> foodchangesearch(String food_address);

	@Select("select * from foodshop F, foodfile FF WHERE F.FOOD_NUMBER = FF.FOOD_NUMBER AND F.FOOD_NUMBER=#{food_number}")
	List<Food> detailfood(int food_number);

	
	int foodreservation(Foodreservation  freservation);

	@Select("select * from FOODRESERVATION WHERE FOOD_NUMBER=#{food_number} order by FOODRESERVATION_DATE")
	List<Foodreservation> detailfoodreser(int food_number);
	
	List<Food_reple> foodreple(@Param("food_number")int food_number);

	List<Food_review> foodreview(@Param("food_number")int food_number);
	
	void insertreple(Food_reple freple);
	
	@Select("SELECT * FROM MEMBER WHERE MEMBER_ID=#{member_id}")
	List<Member> memberinfo(String member_id);

	@Delete("DELETE FROM FOODREPLE WHERE FOOD_REPLE_NUMBER=#{food_reple_number}")
	void repledel(@Param("food_reple_number")int food_reple_number);

	List<Food_review> showfreview(int food_review_number);

	List<Food> getfreserdate();
	
	
}
