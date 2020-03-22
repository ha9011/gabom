package icia.project.gabom.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import icia.project.gabom.dto.SnsFriendStatus;
import icia.project.gabom.dto.Snsposts;

public interface SnsUserPostDao {

	
	SnsFriendStatus check(@Param("userId")String userId,@Param("id") String name);

	List<Snsposts> userPublicPost(@Param("userId")String userId,@Param("rowNum") int rowNum);

	List<Snsposts> userFriendPost(@Param("userId")String userId,@Param("rowNum") int rowNum);

}
