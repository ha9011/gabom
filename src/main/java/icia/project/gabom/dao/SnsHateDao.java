package icia.project.gabom.dao;

import icia.project.gabom.dto.SnsLikeHateCounter;

public interface SnsHateDao {
	
	
	SnsLikeHateCounter likeCheck(SnsLikeHateCounter snsHate);

	boolean likeCancel(SnsLikeHateCounter snsHate);

	boolean hateInsert(SnsLikeHateCounter snsHate);

	void delete(SnsLikeHateCounter snsHate);

	void upDate(SnsLikeHateCounter snsHate);

}
