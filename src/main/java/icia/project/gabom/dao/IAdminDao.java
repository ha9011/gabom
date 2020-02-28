package icia.project.gabom.dao;


import java.util.List;

import icia.project.gabom.dto.Adminfood;
import icia.project.gabom.dto.Adminhouse;



public interface IAdminDao {
	
	List<Adminhouse> getHouseList();
	
	List<Adminfood> getFoodList();
	
	
}
