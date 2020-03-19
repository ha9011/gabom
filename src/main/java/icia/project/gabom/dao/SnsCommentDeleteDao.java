package icia.project.gabom.dao;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;

public interface SnsCommentDeleteDao {

	
	
	@Delete("DELETE FROM SNS_COMMENT WHERE SNS_COMMENT_NUMBER=#{commentNum}")
	boolean delete(@Param("commentNum")int num);

}
