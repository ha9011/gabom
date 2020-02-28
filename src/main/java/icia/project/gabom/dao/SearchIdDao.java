package icia.project.gabom.dao;

import org.apache.ibatis.annotations.Select;

import icia.project.gabom.dto.Member;

public interface SearchIdDao {
	
	
	@Select("SELECT MEMBER_ID FROM MEMBER WHERE MEMBER_EMAIL=#{member_email}")
	Member searchId(String member_email);
	
	
}
