package icia.project.gabom.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import icia.project.gabom.dto.Member;
import icia.project.gabom.dto.SnsFriendStatus;
import icia.project.gabom.dto.SnsSerachResult;
import icia.project.gabom.dto.Snsposts;

public interface SnsSearchDao {

	
	
	List<Snsposts> searchPost(@Param("searchData")String data,@Param("id") String string);

	//List<Snsposts> searchFriendPost(@Param("searchData")String data,@Param("id")String name);

	List<Member> searchFriendList(@Param("searchData")String data);

	List<SnsFriendStatus> search(@Param("id") String name);
	
	
}
