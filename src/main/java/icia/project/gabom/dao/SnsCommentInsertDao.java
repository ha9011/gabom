package icia.project.gabom.dao;


import org.apache.ibatis.annotations.Param;

import icia.project.gabom.dto.SnsCommentDto;

public interface SnsCommentInsertDao {

	boolean insert(SnsCommentDto comment);

	SnsCommentDto select(@Param("commentNumber")int commentNumber);

}
