package icia.project.gabom.dao;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;

public interface SnsPostSecurityDao {

	
	
	@Update("UPDATE SNS_POSTS SET SNS_POSTS_AUTHORITY=#{securityVal} WHERE SNS_POSTS_NUMBER=#{postNumber}")
	boolean edit(@Param("postNumber")int postNumber,@Param("securityVal") int securityVal);

}
