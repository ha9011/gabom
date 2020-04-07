package icia.project.gabom.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;

import icia.project.gabom.dto.SnsDmDto;

public interface SnsDmDao {

	


	List<SnsDmDto> check(String id);

	List<SnsDmDto> getNewContent(@Param("id")String id,@Param("userId") String sendMember);

	List<SnsDmDto> getNewCnt(@Param("id")String id,@Param("userId") String sendMember);

	
	
	@Update("UPDATE SNS_DM SET DM_CHECK=0 "
			+ "WHERE SEND_MEMBER_ID=#{userId} AND GET_MEMBER_ID=#{id}")
	void checkRead(@Param("userId") String userId,@Param("id") String id);

	List<SnsDmDto> getContets(@Param("userId") String userId,@Param("id") String id);

	boolean insertDm(@Param("contents") String contents,@Param("id") String name,@Param("userId") String userId);

}
