package icia.project.gabom.dao;



import org.apache.ibatis.annotations.Select;

import icia.project.gabom.dto.Snsposts;

public interface SnsPostEditDao {
	
	
	int editPost(Snsposts snspost);
	@Select("SELECT SNS_POSTS_CONTENT FROM "
			+ "SNS_POSTS WHERE SNS_POSTS_NUMBER=#{sns_posts_number}")
	Snsposts getContent(Snsposts snsPost);
	@Select("SELECT SNS_POSTS_CONTENT FROM "
			+ "SNS_POSTS WHERE SNS_POSTS_NUMBER=#{sns_posts_number}")
	Snsposts beforeContnets(Snsposts snsPost);

}
