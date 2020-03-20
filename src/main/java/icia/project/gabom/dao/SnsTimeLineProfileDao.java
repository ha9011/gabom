package icia.project.gabom.dao;

import org.apache.ibatis.annotations.Param;

import icia.project.gabom.dto.SnsProfilePost;
import icia.project.gabom.dto.Sns_friend;

public interface SnsTimeLineProfileDao {
	
	
	SnsProfilePost profilePost(@Param("id")String id);

	Sns_friend friendTot(@Param("id") String id);

	Sns_friend friendRequest(@Param("id") String id);

}
