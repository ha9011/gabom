package icia.project.gabom.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import icia.project.gabom.dto.Food;
import icia.project.gabom.dto.Food_reple;
import icia.project.gabom.dto.Food_review;
import icia.project.gabom.dto.Foodreservation;
import icia.project.gabom.dto.House;
import icia.project.gabom.dto.House_reple;
import icia.project.gabom.dto.House_review;
import icia.project.gabom.dto.Housereservation;
import icia.project.gabom.dto.Member;
import icia.project.gabom.dto.Qnaboard;
import icia.project.gabom.dto.SnsCommentDto;
import icia.project.gabom.dto.Snsposts;
import icia.project.gabom.dto.SomoimBoard;

public interface IMyInfoDao {
  //MYINFOMAPPER 참고!!
	
	
	Member selectshowMyInfo(@Param("name") String name);//회원정보

	int restChargeMoney(@Param("chargeMoney")String chargeMoney,@Param("name") String name);

	List<Housereservation> getmyreser(@Param("member_guestid")String member_guestid);// 집예약리스트

	List<Foodreservation> getmyfreser(@Param("member_guestid")String member_guestid);//맛집 예약리스트

	@Delete("DELETE FROM HOUSERESERVATION WHERE RESERVATION_NUMBER=#{reservation_number}")
	void deletehreser(int reservation_number);//집예약 삭제 

	@Delete("DELETE FROM FOODRESERVATION WHERE FOODRESERVATION_NUMBER=#{foodreservation_number}")
	void deletefreser(int foodreservation_number);//맛집 예약 삭제 

	List<Housereservation> getreviewmyreser(@Param("member_guestid")String member_guestid);//리뷰 작성해야하는 집

	List<Foodreservation> getreviewmyfreser(@Param("member_guestid")String member_guestid);//리뷰 작성해야하는 맛집 

	void inserthreview(House_review hrv);//집 리뷰작성 

	@Insert("INSERT INTO HOUSE_REVIEW_IMAGE VALUES(#{house_review_number},#{house_review_orifile},#{house_review_sysfile})")
	boolean housereviewimage(Map<String, String> fMap);// 집 리뷰 이미지 

	List<House_review> getmyhrevie(@Param("member_guestid")String member_guestid);//작성한 집 리뷰 불러오는거 

	List<House_review> showhreview(@Param("house_review_number")int house_review_number);//집 리뷰 상세보기 

	@Update("UPDATE HOUSERESERVATION SET HOUSE_REVIEW_STATUS=1 WHERE RESERVATION_NUMBER=#{reservation_number}")
	void updatereser(@Param("reservation_number")int reservation_number);//리뷰 작성된 집 상태변경 

	@Insert("INSERT INTO FOOD_REVIEW_IMAGE VALUES(#{food_review_number},#{food_review_orifile},#{food_review_sysfile})")
	boolean foodreviewimage(Map<String, String> fMap);//맛집 리뷰 이미지 

	void insertfreview(Food_review frv);//맛집 리뷰 작성 

	@Update("UPDATE FOODRESERVATION SET FOOD_REVIEW_STATUS=1 WHERE FOODRESERVATION_NUMBER=#{foodreservation_number}")
	void updatefreser(@Param("foodreservation_number")int foodreservation_number);//리뷰 작성된 맛집 상태변경 

	
	List<Food_review> getmyfrevie(@Param("member_guestid")String member_guestid);//작성한 리뷰 불러오기 
	
	@Select("SELECT * FROM QNA_BOARD WHERE QNA_MEMBER_ID=#{member_guestid}")
	List<Qnaboard> getmywrite(@Param("member_guestid")String member_guestid);// qna게시판 작성글 보기 
	
	List<SomoimBoard> getmysomowrite(@Param("member_guestid")String member_guestid);//소모임 게시판 작성글 보기 
	
	List<Snsposts> getmylike(@Param("member_guestid")String member_guestid);//sns좋아요 게시글 가져오기 

	List<SomoimBoard> getmysomolike(@Param("member_guestid")String member_guestid);// 소모임 좋아요 컨텐츠 가져오기

	List<Food_reple> getfoodreple(@Param("member_guestid")String member_guestid);//맛집 댓글 

	List<House_reple> gethousereple(@Param("member_guestid")String member_guestid);//숙박 댓글

	List<SnsCommentDto> getsnsreple(@Param("member_guestid")String member_guestid);//sns 댓글
	
	@Select("SELECT QNA_NUMBER, QNA_BODY FROM QNA_BOARD WHERE QNA_NUMBER=#{qna_number}")
	List<Qnaboard> detailqna(@Param("qna_number")int qna_number);//qna 작성글 상세보기 
	
	@Delete("DELETE FROM QNA_BOARD WHERE QNA_NUMBER=#{qna_number}")
	void delqna(@Param("qna_number")int qna_number);//qna 작성글 삭제 
	
	@Select("SELECT * FROM SOMOIM_BOARD WHERE BOARD_NUMBER=#{board_number}")
	List<SomoimBoard> detailsomow(int board_number);

	@Delete("DELETE FROM SOMOIM_BOARD WHERE BOARD_NUMBER=#{board_number}")
	void delsomo(int board_number);

	List<Housereservation> gethreserlist(@Param("house_hostid")String house_hostid);

	List<Foodreservation> getfreserlist(@Param("house_hostid")String house_hostid);

	List<Food> getfood(@Param("house_hostid")String house_hostid);

	List<House> gethouse(@Param("house_hostid")String house_hostid);

	List<House_review> gethrlist(String house_hostid);

	List<Food_review> getfrlist(String house_hostid);

	@Delete("DELETE REGISTHOUSE WHERE HOUSE_NUMBER=#{house_number}")
	void deletehouse(@Param("house_number")int house_number);
	
	@Delete("DELETE FOODSHOP WHERE FOOD_NUMBER=#{food_number}")
	void deletefood(@Param("food_number")int food_number);

	void changememinfo(@Param("member_id")String member_id, @Param("member_name")String member_name, @Param("member_phone")String member_phone, 
			@Param("member_email")String member_email,@Param("member_birth")String member_birth, 
			@Param("member_address")String member_address, @Param("member_hobby")String member_hobby, 
			@Param("member_profile_contents")String member_profile_contents);
	
	@Select("SELECT * FROM MEMBER WHERE MEMBER_ID=#{member_id}")
	List<Member> getmyinfo(@Param("member_id")String member_id);

	
	


	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
	
}
