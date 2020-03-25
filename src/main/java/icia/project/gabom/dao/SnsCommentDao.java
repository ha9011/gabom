package icia.project.gabom.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import icia.project.gabom.dto.Member;
import icia.project.gabom.dto.SnsCommentDto;
import icia.project.gabom.dto.SnsLikeHateCounter;

public interface SnsCommentDao {

	List<SnsCommentDto> snsComment(@Param("postNumber") int postNumber,@Param("rowNum") int row);

	@Select("SELECT MEMBER_PROFILE_PICTURE FROM MEMBER WHERE MEMBER_ID=#{id}")
	Member snsCommentProfilePic(@Param("id") String id);

	SnsLikeHateCounter commentLikeHateGet(@Param("commentNumber") int commentNumber);

	int check(@Param("postNumber")int postNumber);

}
