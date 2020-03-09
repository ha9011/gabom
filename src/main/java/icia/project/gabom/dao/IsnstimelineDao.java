package icia.project.gabom.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import icia.project.gabom.dto.Snsposts;

public interface IsnstimelineDao {

	@Select("SELECT * FROM SNS_POSTS ORDER BY SNS_POSTS_DATE")
	List<Snsposts> getsnsTimeLine(Snsposts snsposts);

	@Select("SELECT * FROM SNS_POSTS WHERE SNS_POSTS_WRITER= #{sns_posts_writer} ORDER BY SNS_POSTS_DATE")
	List<Snsposts> getmytimeline(Snsposts snsposts, @Param("sns_posts_writer") String sns_posts_writer);
	
	List<Snsposts> getfriendtimeline(Snsposts snsposts, @Param("friend_my_id") String friend_my_id);
	 

}
