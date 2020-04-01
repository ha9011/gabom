package icia.project.gabom.dao;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import icia.project.gabom.dto.Adminnotices;
import icia.project.gabom.dto.Qnaboard;
import icia.project.gabom.dto.Serviceqna;

public interface IServiceDao {
	@Select("select all_notices_number,all_notices_title,all_notices_body,all_notices_date,all_notices_views from all_notices_board")
	List<Adminnotices> getNoticeList();
	
	@Select("select qna_number,qna_title,qna_body,qna_member_id,qna_date from qna_board")
	List<Qnaboard> getQnaList();

	boolean getqnawrite(String title, String content);

	List<Serviceqna> getqnalist();
}
