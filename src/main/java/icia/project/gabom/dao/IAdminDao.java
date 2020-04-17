package icia.project.gabom.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;

import icia.project.gabom.dto.AdminSns;
import icia.project.gabom.dto.Adminfood;
import icia.project.gabom.dto.Adminhouse;
import icia.project.gabom.dto.Adminnotices;
import icia.project.gabom.dto.Qnaboard;
import icia.project.gabom.dto.Trip_plan;

public interface IAdminDao {
	//하우스 0번타입 리스트 출력
	List<Adminhouse> getHouseList();
	//음식점 0번타입 출력
	List<Adminfood> getFoodList();
	//house 상세페이지 출력
	List<Adminhouse> gethousemodal(String num);
	//food 상세페이지 출력
	List<Adminfood> getfoodmodal(String num);
	//house 승인
	boolean houseApproved(String number);
	//food 승인
	boolean foodApproved(String number);
	//house 거절
	boolean housefuse(String number);
	//food 거절
	boolean foodfuse(String number);
	//전체공지사항 출력
	List<Adminnotices> getadnotices();
	//공지사항 디테일 출력
	List<Adminnotices> getnoticesmodal(String num);
	//조회수 update
	boolean viewsUpdate(String num);
	//글작성 등록
	boolean getnoticeswrite(@Param("title") String title,@Param("content") String content);
	//질문게시글 전체출력
	List<Qnaboard> getqnaboard();
	//질문 상세정보 출력
	List<Qnaboard> getqnamodal(String num);
	//질문 답글 출력
	List<Qnaboard> getanswermodal(String num);
	//질문 답글등록
	boolean getqnaanswer(@Param("number")String number,@Param("qnaanswer") String qnaanswer);
	//QNA답글 작성 후 디테일 모달 띄우기
	List<Qnaboard> getqnaanswermodal(String num);
	//공지사항 삭제
	boolean getnoticedelete(String num);
	//sns신고 게시글 출력
	List<AdminSns> getsnspostsreport();
	//sns신고 댓글 출력
	List<AdminSns> getsnscommentreport();
	//여행플랜 신청리스트 출력
	List<Trip_plan> getmyplan();
	
	@Update("update trip_plan_recommand set TRIP_PLAN_APPLY =2 where TRIP_NUMBER = #{tripPlanNum}")
	int updatePermit(@Param("tripPlanNum")int tnum);
	
	@Delete("DELETE FROM trip_plan_recommand WHERE TRIP_NUMBER = #{tripPlanNum} ")
	int deletereject(@Param("tripPlanNum")int tnum);
	
}
