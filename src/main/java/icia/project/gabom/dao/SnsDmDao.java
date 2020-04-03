package icia.project.gabom.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import icia.project.gabom.dto.SnsDmDto;

public interface SnsDmDao {

	


	List<SnsDmDto> check(String id);

	List<SnsDmDto> getNewContent(@Param("id")String id,@Param("userId") String sendMember);

	List<SnsDmDto> getNewCnt(@Param("id")String id,@Param("userId") String sendMember);


}
