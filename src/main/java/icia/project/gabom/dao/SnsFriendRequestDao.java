package icia.project.gabom.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import icia.project.gabom.dto.Member;

public interface SnsFriendRequestDao {

	int check(@Param("userId") String friendId,@Param("id") String id);

	void insert(@Param("userId") String friendId,@Param("id") String id);

	int cancel(@Param("userId") String friendId,@Param("id") String id);

	List<Member> sum(@Param("id") String id);

	int acceptCheck(@Param("userId") String friendId,@Param("id") String id);

	int acceptCheck2(@Param("userId") String friendId,@Param("id") String id);

}
