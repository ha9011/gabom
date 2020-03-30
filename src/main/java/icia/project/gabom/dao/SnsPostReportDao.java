package icia.project.gabom.dao;

import org.apache.ibatis.annotations.Update;
import org.springframework.web.bind.annotation.RequestParam;

public interface SnsPostReportDao {
	@Update("UPDATE SNS_POSTS SET SNS_POSTS_REPORT=SNS_POSTS_REPORT+1 "
			+ "WHERE SNS_POSTS_NUMBER=#{postNumber}")
	boolean report(@RequestParam("postNumber")int postNumber);
}
