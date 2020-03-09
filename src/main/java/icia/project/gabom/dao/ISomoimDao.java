package icia.project.gabom.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import icia.project.gabom.dto.JungmoAttend;
import icia.project.gabom.dto.Jungmoroom;
import icia.project.gabom.dto.Somoim;
import icia.project.gabom.dto.SomoimBoard;

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

	
}
