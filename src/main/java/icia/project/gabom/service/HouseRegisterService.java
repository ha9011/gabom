package icia.project.gabom.service;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import icia.project.gabom.dao.IhouseDao;
import icia.project.gabom.dto.House;
import icia.project.gabom.dto.Housefile;
import icia.project.gabom.userClass.houseUploadFile;

@Service //@Component
public class HouseRegisterService {
	
	
		@Autowired
		private IhouseDao hDao;
		
		private ModelAndView mav;
		
		@Autowired
		private houseUploadFile ul;
		

		public ModelAndView houseRegisterUpload(MultipartHttpServletRequest multi
				,Principal principal, HttpServletRequest req) {
			mav=new ModelAndView();
			String view=null;
			
			String house_hostid=principal.getName();
			String house_name = multi.getParameter("house_name"); //이름
			int house_type =Integer.parseInt(multi.getParameter("house_type"));//타입
			int house_price =Integer.parseInt(multi.getParameter("house_price"));//가격
			int house_rooms =Integer.parseInt(multi.getParameter("house_rooms"));//방
			int house_parkable =Integer.parseInt(multi.getParameter("house_parkable"));//주차
			int house_bathrooms =Integer.parseInt(multi.getParameter("house_bathrooms"));//욕실
			int house_beds =Integer.parseInt(multi.getParameter("house_beds"));//방
			String house_mindate = multi.getParameter("house_mindate");//체크인
			String house_maxdate = multi.getParameter("house_maxdate");//체크아웃
			int house_person =Integer.parseInt(multi.getParameter("house_person")); //인원수
			String house_address = multi.getParameter("house_address");//주소
			String house_xpoint = multi.getParameter("house_xpoint"); //위도 
			String house_ypoint = multi.getParameter("house_ypoint");//경도
			
			
			MultipartFile house_mainImage = multi.getFile("house_mainImage");//메인
			List<MultipartFile> house_detailImages = multi.getFiles("house_detailImage");//디테일
			
			//int house_number=Integer.parseInt(multi.getParameter("house_number"));
			//String house_oriname=multi.getParameter("house_oriname");
			//String house_sysname=multi.getParameter("house_sysname");
			
			House house=new House(); 
	
			//Housefile hfile= new Housefile();
			
			
			house.setHouse_address(house_address).setHouse_bathrooms(house_bathrooms).setHouse_beds(house_beds).setHouse_xpoint(house_xpoint).setHouse_ypoint(house_ypoint);
			house.setHouse_name(house_name).setHouse_person(house_person).setHouse_parkable(house_parkable).setHouse_price(house_price);
			house.setHouse_rooms(house_rooms).setHouse_type(house_type).setHouse_mindate(house_mindate).setHouse_maxdate(house_maxdate);
			house.setHouse_hostid(house_hostid);
			
			int house_number=hDao.houseRegisterUpload(house); //데이터 담아서 dao로 감.
			
			System.out.println("currval값="+house.getHouse_number()); 
			
			if(true) {//insert 성공
				view="home";
			}else {// insert 실패
				view="houseRegister"; //jsp
			}
			
			boolean f1= false;
			boolean f2= false;
			if(true) { //한번더 파일 있는지 체크 업로드
				f1=ul.fileUpmain(multi, house.getHouse_number(),req);
				f2=ul.fileUpdetail(multi,house.getHouse_number(),req);
				if(f1) {
					view="home";
				}else {
					view="houseRegister"; //jsp
				}
		}	
			System.out.println("뷰 어디로 갈거니..");
			mav.setViewName(view); //view에 url로 이동
			return mav;
		}
		
		
		
		
}
