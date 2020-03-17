package icia.project.gabom.dao;

import org.apache.ibatis.annotations.Param;

import icia.project.gabom.dto.SnsLikeHateCounter;

public interface CommentLikeDao {
	
	
	
	SnsLikeHateCounter check(SnsLikeHateCounter commentLike);

	void like(SnsLikeHateCounter commentLike);
	
	void hateCancel(SnsLikeHateCounter commentLike);

	void likeUpdate(SnsLikeHateCounter commentLike);

	void likeCancel(SnsLikeHateCounter commentLike);

	int total(@Param("commentNumber") int commentNumber);

}
