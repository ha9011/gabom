package icia.project.gabom.dao;


import java.util.List;

import org.springframework.web.bind.annotation.RequestParam;

import icia.project.gabom.dto.Adminfood;
import icia.project.gabom.dto.Adminhouse;
import icia.project.gabom.dto.House;



public interface IAdminDao {
	
	List<Adminhouse> getHouseList();
	
	List<Adminfood> getFoodList();

	List<String> getjudgedetail();

	List<House> getjudgemodal(String num);
	
	
}
