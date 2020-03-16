package icia.project.gabom.dao;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import icia.project.gabom.dto.SnsLikeHateCounter;

public interface SnsLikeDao {

	SnsLikeHateCounter check(SnsLikeHateCounter snsLike);
	
	
	@Insert("INSERT INTO SNS_LIKE_HATE_COUNTER VALUES(1,#{postNumber},#{memberId},null)")
	boolean like(SnsLikeHateCounter snsLike);

	@Update("UPDATE SNS_LIKE_HATE_COUNTER SET SNS_LIKE=null WHERE SNS_POSTS_NUMBER=#{postNumber} AND SNS_LIKE_HATE_MEMBER_ID=#{memberId}")
	boolean likeCancel(SnsLikeHateCounter snsLike);

	@Update("UPDATE SNS_LIKE_HATE_COUNTER SET SNS_LIKE=1 WHERE SNS_POSTS_NUMBER=#{postNumber} AND SNS_LIKE_HATE_MEMBER_ID=#{memberId}")
	void likeUpdate(SnsLikeHateCounter snsLike);


	void hateCancel(SnsLikeHateCounter snsLike);

	@Delete("DELETE FROM SNS_LIKE_HATE_COUNTER WHERE SNS_POSTS_NUMBER=#{postNumber} AND SNS_LIKE_HATE_MEMBER_ID=#{memberId}")
	void delete(SnsLikeHateCounter snsLike);

	int total(@Param("postNumber") int postNumber);




}
