package icia.project.gabom.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import icia.project.gabom.dto.Food;

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
	List<Food> detailfood(String food_number);

}
