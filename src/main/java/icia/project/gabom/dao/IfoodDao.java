package icia.project.gabom.dao;

import java.util.Map;

import org.apache.ibatis.annotations.Insert;

import icia.project.gabom.dto.Food;

public interface IfoodDao {

	int foodRegisterUpload(Food food);
	
	@Insert("INSERT INTO FOODFILE VALUES(#{food_number},1,#{food_oriname},#{food_sysname})")
	boolean mainfileInsert(Map<String, String> fMap);
	
	@Insert("INSERT INTO FOODFILE VALUES(#{food_number},2,#{food_oriname},#{food_sysname})")
	boolean detailfileInsert(Map<String, String> fMap);

}
