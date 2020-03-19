package icia.project.gabom.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import icia.project.gabom.dto.SnsLikeHateCounter;
import icia.project.gabom.dto.SnsPhoto;
import icia.project.gabom.dto.Snsposts;

public interface IsnstimelineDao {

	/*
	 * @Select("SELECT * FROM (SELECT * FROM SNS_POSTS \r\n" +
	 * "			                ORDER BY SNS_POSTS_DATE desc)\r\n" +
	 * "			WHERE ROWNUM<=#{lowNum} AND (SNS_POSTS_AUTHORITY=0 OR SNS_POSTS_WRITER=#{snspostsid})"
	 * )
	 */
	List<Snsposts> getsnsTimeLine(@Param("id")String id,@Param("rowNum") int lowNum);

	@Select("SELECT * FROM SNS_POSTS WHERE SNS_POSTS_WRITER= #{sns_posts_writer} ORDER BY SNS_POSTS_DATE DESC")
	List<Snsposts> getmytimeline(Snsposts snsposts, @Param("sns_posts_writer") String sns_posts_writer);
	
	List<Snsposts> getfriendtimeline(Snsposts snsposts, @Param("friend_my_id") String friend_my_id);
	
	@Select("SELECT SNS_POSTS_NUMBER,SNS_PHOTO_ORIGIN_NAME,SNS_PHOTO_SYSTEM_NAME FROM SNS_PHOTO WHERE SNS_POSTS_NUMBER=#{postsNumber}")
	List<SnsPhoto> snsPhotoTimeLine(@Param("postsNumber") int number);
	
	@Select("SELECT COUNT(SNS_LIKE) SNSLIKE,COUNT(SNS_HATE) SNSHATE \r\n" + 
			"FROM SNS_LIKE_HATE_COUNTER where SNS_POSTS_NUMBER=#{postsNumber}")
	SnsLikeHateCounter snsLikeHateCounter(@Param("postsNumber") int number);
	@Select("SELECT COUNT(*) FROM SNS_COMMENT WHERE SNS_POSTS_NUMBER=#{postsNumber}")
	int commentCount(@Param("postsNumber") int number);
	
	 

}
