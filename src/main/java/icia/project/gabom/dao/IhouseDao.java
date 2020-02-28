package icia.project.gabom.dao;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import icia.project.gabom.dto.House;


public interface IhouseDao {
	
	int houseRegisterUpload(House house);

	@Insert("INSERT INTO HOUSEFILE VALUES(#{house_number},1,#{house_oriname},#{house_sysname})")
	boolean mainfileInsert(Map<String, String> fMap);

	@Insert("INSERT INTO HOUSEFILE VALUES(#{house_number},2,#{house_oriname},#{house_sysname})")
	boolean detailfileInsert(Map<String, String> fMap);

//	@Select("SELECT * FROM HOUSE_LIST")
	@Select("SELECT * FROM registhouse R, housefile HF WHERE R.HOUSE_NUMBER = HF.HOUSE_NUMBER AND HOUSE_IMAGETYPE=1")
	List<House> getHouseList();
	
	
	
}
