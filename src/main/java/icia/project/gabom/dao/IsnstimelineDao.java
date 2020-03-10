package icia.project.gabom.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import icia.project.gabom.dto.Snsposts;

public interface IsnstimelineDao {

	@Select("SELECT * FROM (SELECT * FROM SNS_POSTS\r\n" + 
			"                ORDER BY SNS_POSTS_DATE DESC)\r\n" + 
			"WHERE ROWNUM<=15 AND (SNS_POSTS_AUTHORITY=0 OR SNS_POSTS_WRITER=#{snspostsid})")
	List<Snsposts> getsnsTimeLine(@Param("snspostsid")String id);

	@Select("SELECT * FROM SNS_POSTS WHERE SNS_POSTS_WRITER= #{sns_posts_writer} ORDER BY SNS_POSTS_DATE DESC")
	List<Snsposts> getmytimeline(Snsposts snsposts, @Param("sns_posts_writer") String sns_posts_writer);
	
	List<Snsposts> getfriendtimeline(Snsposts snsposts, @Param("friend_my_id") String friend_my_id);
	@Select("SELECT SNS_POSTS_NUMBER,SNS_PHOTO_ORIGIN_NAME,SNS_PHOTO_SYSTEM_NAME FROM SNS_PHOTO WHERE SNS_POSTS_NUMBER=#{postsNumber}")
	List<Snsposts> snsPhotoTimeLine(@Param("postsNumber") int number);
	
	 

}
