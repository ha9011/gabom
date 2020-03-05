package icia.project.gabom.dao;

import java.security.Principal;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import icia.project.gabom.dto.Somoim;

public interface ISomoimDao {

	
	int InsertSomoimMake(Somoim sm);

	int InsertOwnerMember(Somoim sm);

	List<Map<String,Object>> selectMainSomoim(@Param("name") String name);

	
}
