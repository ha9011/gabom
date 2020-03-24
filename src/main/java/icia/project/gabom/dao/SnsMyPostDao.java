package icia.project.gabom.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import icia.project.gabom.dto.Snsposts;

public interface SnsMyPostDao {

	
	List<Snsposts> myPost(@Param("id")String id,@Param("rowNum") int lowNum);

	int check(@Param("id")String id);

	
}
