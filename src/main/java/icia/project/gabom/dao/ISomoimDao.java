package icia.project.gabom.dao;

import java.security.Principal;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import icia.project.gabom.dto.ChattingSomoim;
import icia.project.gabom.dto.JungmoAttend;
import icia.project.gabom.dto.Jungmoroom;
import icia.project.gabom.dto.Member;
import icia.project.gabom.dto.Somoim;
import icia.project.gabom.dto.SomoimBoard;
import icia.project.gabom.dto.SomoimMyInfo;
import icia.project.gabom.dto.Somoim_photo_reple;
import icia.project.gabom.dto.Somoimreple;
import icia.project.gabom.dto.Somoim_photoalbum;

public interface ISomoimDao {

	
	int InsertSomoimMake(Somoim sm);

	int InsertOwnerMember(Somoim sm);

	List<Map<String,Object>> selectMainSomoim(@Param("name") String name);

	Somoim selectRoomInfo(@Param("roomnum")String roomnum);

	List<Map<String,Object>> selectRoomMember(@Param("roomnum")String roomnum);

	int insertMakeJunmoRoom(Jungmoroom jungmoroom);

	//개설된 정모룸 가져오는거 
	List<Jungmoroom> selecttMakeJunmoRoom(@Param("somoim_number")int somoim_number,@Param("id")String string);

	List<Jungmoroom> selectAttendJunmoRoom(@Param("somoim_number")int parseInt,@Param("id")String string);

	int insertAttendjungmo(Jungmoroom jungmoroom);

	int deleteAttendjungmo(Jungmoroom jungmoroom);

	List<JungmoAttend> selectshowAttendList(@Param("jungmoNumber")int jungmoNumberInt);

	int deleteSomoim(@Param("somoimnum")int somoimnum, @Param("name")String name);

	
	//소모임 회원 모두 삭제
	int deleteOurSomoim(@Param("somoimnum")int somoimnum);

	//소모임 방 삭제
	int deleteSomoimRoom(@Param("somoimnum")int somoimnum);

	// 나만 탈퇴
	int deleteMySomoim(@Param("somoimnum")int somoimnum, @Param("name")String name);

	int insertSomoimBoard(SomoimBoard smb);

	List<SomoimBoard> selectNotiBoard(@Param("somoimnum")int somoim_number);

	List<SomoimBoard> selectUnNotiBoard(@Param("somoimnum")int somoim_number);

	SomoimBoard selectBoardSomoim(@Param("board_number")int board_number);

	int checkBoardLike(@Param("board_number")int board_number, @Param("name")String name);

	int totalBoardLike(@Param("board_number")int board_number);

	int deleteBoardLike(SomoimBoard sb);

	int insertBoardLike(SomoimBoard sb);
	
	int insertBoardReple(SomoimBoard sb);

	List<Somoimreple> selectBoardRepleList(@Param("board_number")int board_number);

	int getBoardRepleCount(@Param("board_number")int boardNum);

	List<Somoimreple> selectPagingBoardRepleList(SomoimBoard sb);

	SomoimMyInfo selectMySomoimInfo(@Param("somoim_number")int parseInt, @Param("id")String string);

	Jungmoroom selectjungmoinfo(@Param("jungmo_number")int jungmo_number, @Param("id")String string);


	int deleteJungmo(int jungmo_number);
	
	int modifyjunmo(Jungmoroom jr);

	int deleteboard(int board_number);

	int updateSomoimBoard(SomoimBoard smb);

	int deleteSomoimBoardReple(int somoim_board_reple_number);
	
	Member selectMyAddressHobby(@Param("member_id")String name);
	
	List<Somoim> selectMyRecommandSomoim(Member mb);
	
	List<Somoim> selectSearchSomoim(@Param("address")String address,@Param("hobby")String hobby);

	List<Somoim> selectHobbySearchSomoim(@Param("hobby")String hobby);

	List<Somoim> selectAddressSearchSomoim(@Param("address")String address);
	
	int insertJoinSomoim(@Param("somoim_number")int somoim_number,@Param("name")String name);


	List<Member> registSomoimMember(@Param("somoim_number")int somoim_number);

	List<Member> orginSomoimMember(@Param("somoim_number")int somoim_number);

	int insertchatting(@Param("id")String id,@Param("msg")String msg, @Param("somoimNumber")int somoimNumber);
	

	List<ChattingSomoim> selectTodayChattingData(@Param("somoim_number")int somoimNumber);

	List<ChattingSomoim> selectYesterdayChattingData(@Param("somoim_number")int somoimNumber);

	List<ChattingSomoim> selectInfinityChattingData(@Param("somoim_number")int somoimNumber, @Param("date")String date);


	int repleModify(@Param("content")String content, @Param("replenumber")int replenumber);
	
	int deleteMember(@Param("id")String id, @Param("sNumber")int sNumber);
	
	int permitmember(@Param("id")String id, @Param("sNumber")int sNumber);
	
	List<SomoimBoard> selectNotiSomoim(@Param("id")String name);
	
	//소켓
	List<Member> joinMemberSomoimList(@Param("somoim_number")int somoim_number);
	
	//--------------------------------------------------------------------------------------------이예상
	
	boolean somoalbumInsert(Map<String, String> fMap);

	@Select("select * from SOMOIM_PHOTOALBUM where SOMOIM_NUMBER=#{somo_number}")
	List<Somoim_photoalbum> getsomopicList(@Param("somo_number") int somo_number);

	@Select("select * from SOMOIM_PHOTOALBUM WHERE PHOTO_NUMBER =#{num} ORDER BY PHOTO_UPLOAD_DATE DESC")
	Somoim_photoalbum showimginfo(String num);
	
	@Select("select * from SOMOIM_PHOTO_REPLE WHERE PHOTO_NUMBER =#{num} ORDER BY REPLY_DATE DESC")
	List<Somoim_photo_reple> getimgreple(String num);
	
	@Select("select count(*) from SOMOIM_PHOTO_LIKE WHERE PHOTO_NUMBER =#{num}")
	int getimglike(String num);

	@Delete("DELETE FROM SOMOIM_PHOTO_REPLE WHERE REPLY_NUMBER=#{reply_number}")
	int deletereple(@Param("reply_number")int reply_number);
	
	@Select("select * from SOMOIM_PHOTO_REPLE WHERE PHOTO_NUMBER =#{photo_number} ORDER BY REPLY_DATE DESC")
	List<Somoim_photo_reple> recallreple(int photo_number);

	int insertpicreple(Somoim_photo_reple picreple);
	
	@Update("UPDATE SOMOIM_PHOTO_REPLE SET REPLY_CONTENT = #{reply_content} WHERE REPLY_NUMBER= #{reply_number} ")
	int modifypicreple(Somoim_photo_reple spreple);
	
	@Select("SELECT count(*) as mylike FROM SOMOIM_PHOTO_LIKE WHERE LIKE_ID = #{name} AND PHOTO_NUMBER = #{photo_number}")
	Somoim_photoalbum getMyImgLike(@Param("photo_number")String num, @Param("name")String name);

	@Insert("INSERT INTO SOMOIM_PHOTO_LIKE VALUES( SEQ_SOMOIM_PHOTO_LIKE.nextval, #{name} ,#{photo_number}  , #{somoimNum} ,0)" )
	int insertPhotoLike(@Param("photo_number")int photonum, @Param("name")String name, @Param("somoimNum")int somoimNum);

	@Delete("DELETE FROM SOMOIM_PHOTO_LIKE WHERE PHOTO_NUMBER=#{photo_number} AND LIKE_ID=#{name}")
	int deletePhotoLike(@Param("photo_number")int photonum, @Param("name")String name);

	

	


	




	


	

	

	
	

	


	

	
}
