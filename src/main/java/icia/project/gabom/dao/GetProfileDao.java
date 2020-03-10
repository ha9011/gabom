package icia.project.gabom.dao;

import org.apache.ibatis.annotations.Select;

import icia.project.gabom.dto.Member;

public interface GetProfileDao {
	
	
	@Select("SELECT MEMBER_NAME,MEMBER_PROFILE_PICTURE,MEMBER_ID FROM MEMBER WHERE MEMBER_ID=#{member_id}")
	Member getProfile(Member member);

}
