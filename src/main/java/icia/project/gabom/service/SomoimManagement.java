package icia.project.gabom.service;

import java.security.Principal;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import icia.project.gabom.dao.ISomoimDao;
import icia.project.gabom.dto.Food;
import icia.project.gabom.dto.House;
import icia.project.gabom.dto.JungmoAttend;
import icia.project.gabom.dto.Jungmoroom;
import icia.project.gabom.dto.Somoim;
import icia.project.gabom.dto.SomoimBoard;
import icia.project.gabom.dto.Somoim_photoalbum;
import icia.project.gabom.userClass.SomoimAlbumfileUpload;
import icia.project.gabom.userClass.SomoimUploadFile;

@Service
public class SomoimManagement {


	private Somoim sm;
	private SomoimBoard smb;
	private ModelAndView mav;
	@Autowired
	private ISomoimDao sDao;

	@Autowired
	private SomoimUploadFile sUpload;

	public String InsertSomoim(MultipartHttpServletRequest multi, Principal pr) {
		// TODO Auto-generated method stub
		sm = new Somoim();

		System.out.println("multi.getParameter(\"somoim_maker\") : " + multi.getParameter("somoim_maker"));

		String somoim_maker = pr.getName();
		String somoim_name = multi.getParameter("somoim_name");
		String somoim_introduce = multi.getParameter("somoim_introduce");
		String somoim_location = multi.getParameter("somoim_location");
		String somoim_detail_location = multi.getParameter("somoim_detail_location");
		String somoim_interest = multi.getParameter("somoim_interest");
		String somoim_person = multi.getParameter("somoim_person");

		MultipartFile somoim_mainpicture_file = multi.getFile("somoim_mainpicture");
		String somoim_mainpicture = somoim_mainpicture_file.getOriginalFilename(); // 사진 원래 이름

		String somoim_name_noblank = somoim_name.replaceAll(" ", "");
		String somoim_sys_mainpicture = "./resources/somoimimage/upload/" + somoim_name_noblank
				+ System.currentTimeMillis() + "."
				+ somoim_mainpicture.substring(somoim_mainpicture.lastIndexOf(".") + 1);

		String sysfile = somoim_name + System.currentTimeMillis() + "."
				+ somoim_mainpicture.substring(somoim_mainpicture.lastIndexOf(".") + 1);

		sm.setSomoim_detail_location(somoim_detail_location).setSomoim_interest(somoim_interest)
				.setSomoim_introduce(somoim_introduce);
		sm.setSomoim_location(somoim_location).setSomoim_mainpicture(somoim_mainpicture).setSomoim_maker(somoim_maker)
				.setSomoim_name(somoim_name);
		sm.setSomoim_person(somoim_person).setSomoim_sys_mainpicture(somoim_sys_mainpicture);

		System.out.println("sm : " + sm.toString());

		int result = sDao.InsertSomoimMake(sm);
		System.out.println("insert : " + result);
		System.out.println("currvar : " + sm.getSomoim_number()); // 현재 번호

		int currval = sm.getSomoim_number();

		sDao.InsertOwnerMember(sm);

		String view = null;

		if (result == 1) {
			sUpload.fileUpProfilePic(multi, sysfile);
			view = "mainsomoim";
		} else {
			System.out.println("회원등록 실패");
			view = "makesomoim";
		}
		System.out.println("view = " + view);
		return view;
	}

	public ModelAndView selectMainSomoim(Principal pr, ModelAndView mav) {
		// TODO Auto-generated method stub

		List<Map<String, Object>> sList = sDao.selectMainSomoim(pr.getName());

		String json = new Gson().toJson(sList);
		System.out.println("json : " + json);
		mav.addObject("joinMoim", json);
		mav.setViewName("somoim/mainsomoim");
		return mav;
	}

	public ModelAndView somoimRoomData(ModelAndView mav, String roomnum, Principal pr) {
		System.out.println("내프로젝트의 루트경로는?  " + System.getProperty("user.dir"));
		// 1-1정보 단계 (제목, 타이틀, 위치 등등...)
		sm = new Somoim();
		sm = sDao.selectRoomInfo(roomnum);
		System.out.println(sm.toString());
		String JsonBasicInfo = new Gson().toJson(sm);
		System.out.println("sm json : " + JsonBasicInfo);
		mav.addObject("JsonBasicInfo", JsonBasicInfo); // 기본정보 받아옴
		mav.addObject("roomnum", roomnum);

		// 1-2회원
		List<Map<String, Object>> mList = sDao.selectRoomMember(roomnum);
		String JsonMemberList = new Gson().toJson(mList);
		System.out.println("sm JsonMemberList : " + JsonMemberList);
		mav.addObject("JsonMemberList", JsonMemberList); // 기본정보 받아옴

		// 1-3 정모방 // 그리고 참석인원
		// (1)정모방
		List<Jungmoroom> Jlist = sDao.selecttMakeJunmoRoom(Integer.parseInt(roomnum)); // 방만 뽑기
		String JsonJungmoRoom = new Gson().toJson(Jlist);
		System.out.println("sm JsonJungmoRoom : " + JsonJungmoRoom);

		mav.addObject("JsonJungmoRoom", JsonJungmoRoom);

		// (2)참석인원
		List<Jungmoroom> attendlist = sDao.selectAttendJunmoRoom(Integer.parseInt(roomnum), pr.getName()); // 방만 뽑기
		String JsonAttendlist = new Gson().toJson(attendlist);
		mav.addObject("JsonAttendlist", JsonAttendlist);
		System.out.println("sm JsonAttendlist : " + JsonAttendlist);

		mav.setViewName("somoim/somoimroom");
		return mav;
	}

	public String insertSelecttMakeJunmoRoom(Jungmoroom jungmoroom) {
		// 아이디, 내용
		int result = sDao.insertMakeJunmoRoom(jungmoroom); // 인서트
		System.out.println("insert 확인 : " + result);
		List<Jungmoroom> Jlist = sDao.selecttMakeJunmoRoom(jungmoroom.getJungmo_number()); // 셀렉트
		String jsonJungmoRooms = new Gson().toJson(Jlist);
		return jsonJungmoRooms;
	}

	public String attendjungmo(Principal pr, HashMap<String, String> map, Jungmoroom jungmoroom) {
		map.put("MEMBER_ID", pr.getName());
		for (String a : map.keySet()) {
			System.out.println(a + " : " + map.get(a));
		}
		jungmoroom.setJungmo_number(Integer.parseInt(map.get("jungmo_number")))
				.setSomoim_number(Integer.parseInt(map.get("somoim_number")));
		jungmoroom.setJungmo_join_id(map.get("MEMBER_ID"));
		System.out.println(" jungmoroom : " + jungmoroom.toString());
		int result = sDao.insertAttendjungmo(jungmoroom);

		return "참석";
	}

	public String cancelAttendjunmo(Principal pr, HashMap<String, String> map, Jungmoroom jungmoroom) {
		map.put("MEMBER_ID", pr.getName());
		for (String a : map.keySet()) {
			System.out.println(a + " : " + map.get(a));
		}
		jungmoroom.setJungmo_number(Integer.parseInt(map.get("jungmo_number")))
				.setSomoim_number(Integer.parseInt(map.get("somoim_number")));
		jungmoroom.setJungmo_join_id(map.get("MEMBER_ID"));
		System.out.println(" jungmoroom : " + jungmoroom.toString());
		int result = sDao.deleteAttendjungmo(jungmoroom);
		return "참석취소";
	}

	public String showAttendList(String jungmoNumber) {

		int jungmoNumberInt = Integer.parseInt(jungmoNumber);
		// 타입 변경해야함 일단은 이렇게.
		List<JungmoAttend> attendList = sDao.selectshowAttendList(jungmoNumberInt);

		// System.out.println("attendList : " +attendList.toString());

		String result = new Gson().toJson(attendList);
		System.out.println("JsonattendListOb : " + result);

		return result;
	}

	public String deleteSomoim(int somoimnum, String name, String somoimmaker) {

		// 방장인지 아닌지에 따라 분기
		int result = 0;
		if (name.equals(somoimmaker) == true) { // 방장이니 방도 지우고, 맴버도 지우기 casecade

			result = sDao.deleteOurSomoim(somoimnum); // 모든 회원부터 지우기
			System.out.println("모든 맴버 삭제 : " + result);
			result = sDao.deleteSomoimRoom(somoimnum); // 소모임지우기
			System.out.println("방삭제 : " + result);
		} else { // 방 그냥 탈퇴
			result = sDao.deleteMySomoim(somoimnum, name); // 나만
			System.out.println("나만 탈퇴: " + result);
		}

		String a = (result != 0) ? "삭제" : "뭔가잘못됨";
		System.out.println("결과 : " + a);
		return a;
	}

	public String insertSomoimBoard(MultipartHttpServletRequest multi, String name) {
		smb = new SomoimBoard();

//		Enumeration<String> a = multi.getParameterNames();
//		while(a.hasMoreElements()) {
//			System.out.println(a.nextElement());
//		}

		int somoim_number = Integer.parseInt(multi.getParameter("somoim_number"));
		String board_writer = name;
		String board_type = multi.getParameter("boardtype");
		String board_title = multi.getParameter("boardtitle");
		String board_content = multi.getParameter("boardCont");
		String board_fix = null;
		if ("고정".equals(multi.getParameter("mainboard"))) {
			board_fix = "고정";
		} else {
			board_fix = "비고정";
		}
		smb.setSomoim_number(somoim_number).setBoard_writer(board_writer).setBoard_type(board_type);
		smb.setBoard_title(board_title).setBoard_content(board_content).setBoard_fix(board_fix);

//	member_profile_picture = "./resources/userprofileimage/upload/"+member_id+System.currentTimeMillis()+"."
//	+member_profile_original.substring(member_profile_original.lastIndexOf(".")+1);
//	

		System.out.println("firstPic : " + multi.getFile("firstPic").getOriginalFilename());
		System.out.println("secondPic : " + multi.getFile("secondPic").getOriginalFilename());
		System.out.println("thirdPic : " + multi.getFile("thirdPic").getOriginalFilename());
		System.out.println("firstPic t : " + multi.getFile("firstPic").isEmpty());
		System.out.println("secondPic t  : " + multi.getFile("secondPic").isEmpty());
		System.out.println("thirdPic t : " + multi.getFile("thirdPic").isEmpty());

		String board_first_pic = "";
		String board_first_syspic = "";
		if (!multi.getFile("firstPic").isEmpty()) {
			board_first_pic = multi.getFile("firstPic").getOriginalFilename();
			board_first_syspic = "./resources/somoimboard/upload/" + System.currentTimeMillis() + "."
					+ board_first_pic.substring(board_first_pic.lastIndexOf(".") + 1);

			smb.setBoard_first_pic(board_first_pic).setBoard_first_syspic(board_first_syspic);
		}

		String board_second_pic = "";
		String board_second_syspic = "";
		if (!multi.getFile("secondPic").isEmpty()) {
			board_second_pic = multi.getFile("secondPic").getOriginalFilename();
			board_second_syspic = "./resources/somoimboard/upload/" + System.currentTimeMillis() + "."
					+ board_second_pic.substring(board_second_pic.lastIndexOf(".") + 1);

			smb.setBoard_second_pic(board_second_pic).setBoard_second_syspic(board_second_syspic);
		}

		String board_third_pic = "";
		String board_third_syspic = "";
		if (!multi.getFile("thirdPic").isEmpty()) {

			board_third_pic = multi.getFile("thirdPic").getOriginalFilename();
			board_third_syspic = "./resources/somoimboard/upload/" + System.currentTimeMillis() + "."
					+ board_third_pic.substring(board_third_pic.lastIndexOf(".") + 1);

			smb.setBoard_third_pic(board_third_pic).setBoard_third_syspic(board_third_syspic);
		}

		System.out.println("smb : " + smb.toString());

		int result = sDao.insertSomoimBoard(smb);

		return null;
	}

	public String somopiclist(int somo_number) {
		String json2= null;
		System.out.println("사진 출력해줘 ");
		
		List<Somoim_photoalbum> somopiclist = sDao.getsomopicList(somo_number);
		
		json2 = new Gson().toJson(somopiclist);
		System.out.println(json2);
		return json2;
	}

	// -------------------------------------------------------------------------------------------------이예상


}
