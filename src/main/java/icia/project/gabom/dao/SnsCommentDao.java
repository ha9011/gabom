package icia.project.gabom.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import icia.project.gabom.dto.Member;
import icia.project.gabom.dto.SnsCommentDto;

public interface SnsCommentDao {

	
	
	
	List<SnsCommentDto> snsComment(@Param("postNumber")int postNumber);
	@Select( "SELECT MEMBER_PROFILE_PICTURE FROM MEMBER WHERE MEMBER_ID=#{id}")
	Member snsCommentProfilePic(@Param("id") String id);

}
