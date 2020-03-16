package icia.project.gabom.dao;

import org.apache.ibatis.annotations.Param;

import icia.project.gabom.dto.SnsLikeHateCounter;

public interface SnsCommentHateDao {

	SnsLikeHateCounter check(SnsLikeHateCounter commentHate);

	void hate(SnsLikeHateCounter commentHate);

	void likeCancel(SnsLikeHateCounter commentHate);

	void hateUpdate(SnsLikeHateCounter commentHate);

	void hateCancel(SnsLikeHateCounter commentHate);

	int total(@Param("commentNumber")int commentNumber);


}
