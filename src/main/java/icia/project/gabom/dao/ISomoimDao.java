package icia.project.gabom.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import icia.project.gabom.dto.JungmoAttend;
import icia.project.gabom.dto.Jungmoroom;
import icia.project.gabom.dto.Somoim;
import icia.project.gabom.dto.SomoimBoard;
import icia.project.gabom.dto.Somoimreple;

public interface ISomoimDao {

	
	int InsertSomoimMake(Somoim sm);

	int InsertOwnerMember(Somoim sm);

	List<Map<String,Object>> selectMainSomoim(@Param("name") String name);

	Somoim selectRoomInfo(@Param("roomnum")String roomnum);

	List<Map<String,Object>> selectRoomMember(@Param("roomnum")String roomnum);

	int insertMakeJunmoRoom(Jungmoroom jungmoroom);

	//개설된 정모룸 가져오는거 
	List<Jungmoroom> selecttMakeJunmoRoom(@Param("somoim_number")int somoim_number);

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




	
	
}
