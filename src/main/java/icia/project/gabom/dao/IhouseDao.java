package icia.project.gabom.dao;


import java.util.Map;

import org.apache.ibatis.annotations.Insert;

import icia.project.gabom.dto.House;


public interface IhouseDao {
	
	int houseRegisterUpload(House house);

	@Insert("INSERT INTO HOUSEFILE VALUES(#{house_number},1,#{house_oriname},#{house_sysname})")
	boolean mainfileInsert(Map<String, String> fMap);

	@Insert("INSERT INTO HOUSEFILE VALUES(#{house_number},2,#{house_oriname},#{house_sysname})")
	boolean detailfileInsert(Map<String, String> fMap);
	
}
