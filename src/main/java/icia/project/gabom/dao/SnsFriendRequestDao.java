package icia.project.gabom.dao;

import org.apache.ibatis.annotations.Param;

public interface SnsFriendRequestDao {

	int check(@Param("userId") String friendId,@Param("id") String id);

	void insert(@Param("userId") String friendId,@Param("id") String id);


}
