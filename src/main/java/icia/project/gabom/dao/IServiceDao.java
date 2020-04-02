package icia.project.gabom.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import icia.project.gabom.dto.Adminnotices;
import icia.project.gabom.dto.Qnaboard;

public interface IServiceDao {
	//전체공지 출력
	@Select("select all_notices_number,all_notices_title,all_notices_body,all_notices_date,all_notices_views from all_notices_board")
	List<Adminnotices> getNoticeList();
	//qna리스트 출력
	@Select("select qna_number,qna_title,qna_body,qna_member_id,qna_date from qna_board order by qna_number desc")
	List<Qnaboard> getQnaList();
	//qna글쓰기
	@Insert("insert into qna_board values(SEQ_QNA_NUMBER.nextval, #{title}, #{content}, #{member}, SYSDATE)")
	boolean getqnawrite(@Param("title")String title,@Param("content")String content,@Param("member")String member);
	
	//List<Qnaboard> getqnawritelist();
}
