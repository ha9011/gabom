package icia.project.gabom.dao;

import org.apache.ibatis.annotations.Param;

import icia.project.gabom.dto.Member;

public interface IMyInfoDao {
  //MYINFOMAPPER 참고!!
	
	
	Member selectshowMyInfo(@Param("name") String name);

	int restChargeMoney(@Param("chargeMoney")String chargeMoney,@Param("name") String name);
	
}
