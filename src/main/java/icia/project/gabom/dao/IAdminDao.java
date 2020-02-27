package icia.project.gabom.dao;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import icia.project.gabom.dto.House;



public interface IAdminDao {
	
	List<HashMap<String, String>> getHouseList();
	
	
}
