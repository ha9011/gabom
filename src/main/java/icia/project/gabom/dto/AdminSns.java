package icia.project.gabom.dto;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.experimental.Accessors;

@Alias("adminsns")
@Data
@Accessors(chain=true)
public class AdminSns {
	//sns게시글
	public int sns_posts_number; //게시글번호
	public String sns_posts_content; //게시글 내용
	public String sns_posts_writer; //게시글 작성자
	public int sns_posts_report; //게시글 신고 횟수
	
	//sns댓글
	public int sns_comment_number; //댓글번호
	public String sns_comment_content; //댓글내용
	public String sns_comment_member_id; //댓글 작성자
	public int sns_comment_report; //댓글 신고횟수
}
