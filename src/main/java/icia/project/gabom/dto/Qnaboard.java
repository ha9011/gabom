package icia.project.gabom.dto;

import org.apache.ibatis.type.Alias;
import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;
import lombok.experimental.Accessors;

@Alias("qnaboard")
@Data
@Accessors(chain=true)
public class Qnaboard {
	private int qna_number; //질문번호
	private String qna_title; //질문제목
	private String qna_body; //질문내용
	private String qna_member_id; //작성자
	@DateTimeFormat(pattern="yyyy-mm-dd")
	private String qna_date; //작성일
	//답글 게시판
	private int qna_answer_number; //질문답글
	private String qna_reply; //질문답글
	
}
