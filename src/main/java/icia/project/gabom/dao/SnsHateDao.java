package icia.project.gabom.dao;

import org.apache.ibatis.annotations.Param;

import icia.project.gabom.dto.SnsLikeHateCounter;

public interface SnsHateDao {
	
	
	SnsLikeHateCounter likeCheck(SnsLikeHateCounter snsHate);

	boolean likeCancel(SnsLikeHateCounter snsHate);

	boolean hateInsert(SnsLikeHateCounter snsHate);

	void delete(SnsLikeHateCounter snsHate);

	void upDate(SnsLikeHateCounter snsHate);

	int total(@Param("postNumber")int postNumber);

}
