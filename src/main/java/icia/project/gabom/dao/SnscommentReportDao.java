package icia.project.gabom.dao;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;

public interface SnscommentReportDao {

	@Update("UPDATE SNS_COMMENT "
			+ "SET SNS_COMMENT_REPORT=SNS_COMMENT_REPORT+1"
			+ " WHERE SNS_COMMENT_NUMBER=#{commentNumber}")
	boolean report(@Param("commentNumber")int commentNumber);

}
