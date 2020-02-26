package icia.project.gabom.dao;


import java.util.Map;

import org.apache.ibatis.annotations.Insert;

import icia.project.gabom.dto.House;


public interface IhouseDao {
	
	//@Insert(") ")
	
	int houseRegisterUpload(House house);

	@Insert("INSERT INTO HFILE VALUES(#{house_number},#{house_oriname},#{house_sysname},1)")
	boolean mainfileInsert(Map<String, String> fMap);

	@Insert("INSERT INTO HFILE VALUES(#{house_number},#{house_oriname},#{house_sysname},1)")
	boolean detailfileInsert(Map<String, String> fMap);
	
}
