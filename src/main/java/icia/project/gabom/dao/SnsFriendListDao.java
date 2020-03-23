package icia.project.gabom.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import icia.project.gabom.dto.Member;

public interface SnsFriendListDao {

	List<Member> get(@Param("id")String id);

}
