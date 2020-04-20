package icia.project.gabom;


import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.io.IOUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.exc.MismatchedInputException;
import com.google.gson.Gson;

import icia.project.gabom.dto.TripAreaBasedList;
import icia.project.gabom.dto.TripAreaBasedresponse;
import icia.project.gabom.exception.NoTouristSpotException;
import icia.project.gabom.service.AdminjudgeManagement;

@RestController
public class RestApiController {
	
	@RequestMapping(value = "/apisearch", method = RequestMethod.GET, produces = "text/plain;charset=utf-8")
	public String apisearch(@RequestParam("areaCode") String areaCode) throws JsonMappingException, 
							JsonProcessingException {
			
		String addr = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?ServiceKey=";
		String serviceKey = "%2B%2BXC1MAaQv2wQPBU5ZLVxzXuxpix4TpZqHJvYRBf4hHytxBnkk%2B227wTPvDoN8BrUyVEKMtvsdeHKmbRKmZz%2BQ%3D%3D"; //인증키
		String parameter = "";
		parameter = parameter + "&" + "contentTypeId=12";
		parameter = parameter + "&" + "areaCode="+areaCode;  //지역코드(변경되는 부분)
		parameter = parameter + "&" + "pageNo=1&numOfRows=300"; //페이지번호,한페이지 검색 결과 수
		parameter = parameter + "&" + "MobileOS=ETC"; 			//필수 os구분
		parameter = parameter + "&" + "MobileApp=gabom"; 		//필수 서비스명
		parameter = parameter + "&" + "_type=json";				//제이슨 타입으로 받음
		
		
		addr = addr + serviceKey + parameter;
		
		String json = null;
		try {
			
			URL url  = new URL(addr);
			InputStream in;
			try {
				in = url.openStream();
				ByteArrayOutputStream  bos1 = new ByteArrayOutputStream();	//InputStream의 데이터들을 바이트 배열로 저장
				IOUtils.copy(in, bos1);	//데이터를 바이트 배열로 복사
				in.close();
				bos1.close();
			    
				json = bos1.toString();
			    				
			} catch (IOException e) {
				e.printStackTrace();
			} 	//URL로 부터 자바로 데이터 읽어오도록 URL객체로 스트림 열기
			
		
		} catch (MalformedURLException e) {
			e.printStackTrace();
		}
		//사진파일 없는경우 제외
		ObjectMapper mapper =new ObjectMapper();
		TripAreaBasedresponse areabasedlist = mapper.readValue(json, TripAreaBasedresponse.class);
		List<TripAreaBasedList> result = areabasedlist.getResponse().getBody().getItems().getItem();
		
		List<TripAreaBasedList> result1 = new ArrayList<TripAreaBasedList>();
		TripAreaBasedList innerDto = new TripAreaBasedList();
		
		for( TripAreaBasedList field : result) {
			if(field.getFirstimage().equals("없음")==false) {
				innerDto = field;
				result1.add(innerDto);
				innerDto=new TripAreaBasedList();
			}
		}
		
		String resultJson = new Gson().toJson(result1);
		
		return resultJson;
	}

	@RequestMapping(value = "/sigungusearch", method = RequestMethod.GET, produces = "text/plain;charset=utf-8")
	public String sigungusearch(@RequestParam("areaCode") String areaCode, @RequestParam("sigunguCode") Object sigunguCode) 
			throws JsonMappingException, JsonProcessingException {//
		String addr = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?ServiceKey=";
		String serviceKey = "%2B%2BXC1MAaQv2wQPBU5ZLVxzXuxpix4TpZqHJvYRBf4hHytxBnkk%2B227wTPvDoN8BrUyVEKMtvsdeHKmbRKmZz%2BQ%3D%3D"; //인증키
		String parameter = "";
		parameter = parameter + "&" + "contentTypeId=12";
		parameter = parameter + "&" + "areaCode="+areaCode;  //지역코드(변경되는 부분)
		parameter = parameter + "&" + "sigunguCode="; //시군구 코드 
		
		if(areaCode.equals("1")) { //areaCode가 서울일때
			if(sigunguCode.equals("강남구")) {
				parameter = parameter + 1;
			}else if(sigunguCode.equals("강동구")) {
				parameter = parameter + 2;
			}else if(sigunguCode.equals( "강북구")) {
				parameter = parameter + 3;
			}else if(sigunguCode.equals( "강서구")){
				parameter = parameter + 4;
			}else if(sigunguCode.equals( "관악구")) {
				parameter = parameter + 5;
			}else if(sigunguCode.equals( "광진구")) {
				parameter = parameter + 6;
			}else if(sigunguCode.equals( "구로구")) {
				parameter = parameter + 7;
			}else if(sigunguCode.equals( "금천구")) {
				parameter = parameter + 8;
			}else if(sigunguCode.equals( "노원구")) {
				parameter = parameter + 9;
			}else if(sigunguCode.equals( "도봉구")) {
				parameter = parameter + 10;
			}else if(sigunguCode.equals( "동대문구")) {
				parameter = parameter + 11;
			}else if(sigunguCode.equals( "동작구")) {
				parameter = parameter + 12;
			}else if(sigunguCode.equals( "마포구")) {
				parameter = parameter + 13;
			}else if(sigunguCode.equals( "서대문구")) {
				parameter = parameter + 14;
			}else if(sigunguCode.equals( "서초구")) {
				parameter = parameter + 15;
			}else if(sigunguCode.equals( "성동구")) {
				parameter = parameter + 16;
			}else if(sigunguCode.equals( "성북구")) {
				parameter = parameter + 17;
			}else if(sigunguCode.equals( "송파구")) {
				parameter = parameter + 18;
			}else if(sigunguCode.equals( "양천구")) {
				parameter = parameter + 19;
			}else if(sigunguCode.equals( "영등포구")) {
				parameter = parameter + 20;
			}else if(sigunguCode.equals( "용산구")) {
				parameter = parameter + 21;
			}else if(sigunguCode.equals( "은평구")) {
				parameter = parameter + 22;
			}else if(sigunguCode.equals( "종로구")) {
				parameter = parameter + 23;
			}else if(sigunguCode.equals( "중구")) {
				parameter = parameter + 24;
			}else if(sigunguCode.equals( "중랑구")) {
				parameter = parameter + 25;
			}
		}else if(areaCode.equals("2")) { //areaCode가 인천일때
			if(sigunguCode.equals("강화군")) {
				parameter = parameter + 1;
			}else if(sigunguCode.equals("계양구")) {
				parameter = parameter + 2;
			}else if(sigunguCode.equals( "미추홀구")) {
				parameter = parameter + 3;
			}else if(sigunguCode.equals( "남동구")) {
				parameter = parameter + 4;
			}else if(sigunguCode.equals( "동구")) {
				parameter = parameter + 5;
			}else if(sigunguCode.equals( "부평구")) {
				parameter = parameter + 6;
			}else if(sigunguCode.equals( "서구")) {
				parameter = parameter + 7;
			}else if(sigunguCode.equals( "연수구")) {
				parameter = parameter + 8;
			}else if(sigunguCode.equals( "웅진군")) {
				parameter = parameter + 9;
			}else if(sigunguCode.equals( "중구")) {
				parameter = parameter + 10;
			}
		}else if(areaCode.equals("3")) { //areaCode가 대전일때
			if(sigunguCode.equals( "대덕구")) {
				parameter = parameter + 1;
			}else if(sigunguCode.equals( "동구")) {
				parameter = parameter + 2;
			}else if(sigunguCode.equals( "서구")) {
				parameter = parameter + 3;
			}else if(sigunguCode.equals( "유성구")) {
				parameter = parameter + 4;
			}else if(sigunguCode.equals( "중구")) {
				parameter = parameter + 5;
			}
		}else if(areaCode.equals("4")) { //areaCode가 대구일때
			if(sigunguCode.equals( "남구")) {
				parameter = parameter + 1;
			}else if(sigunguCode.equals( "달서구")) {
				parameter = parameter + 2;
			}else if(sigunguCode.equals( "달성군")) {
				parameter = parameter + 3;
			}else if(sigunguCode.equals( "동구")) {
				parameter = parameter + 4;
			}else if(sigunguCode.equals( "북구")) {
				parameter = parameter + 5;
			}else if(sigunguCode.equals( "서구")) {
				parameter = parameter + 6;
			}else if(sigunguCode.equals( "수성구")) {
				parameter = parameter + 7;
			}else if(sigunguCode.equals( "중구")) {
				parameter = parameter + 8;
			}
		}else if(areaCode.equals("5")) { //areaCode가 광주일때
			if(sigunguCode.equals( "광산구")) {
				parameter = parameter + 1;
			}else if(sigunguCode.equals( "남구")) {
				parameter = parameter + 2;
			}else if(sigunguCode.equals( "동구")) {
				parameter = parameter + 3;
			}else if(sigunguCode.equals( "북구")) {
				parameter = parameter + 4;
			}else if(sigunguCode.equals( "서구")) {
				parameter = parameter + 5;
			}
		}else if(areaCode.equals("6")) { //areaCode가 부산일때
			if(sigunguCode.equals( "강서구")) {
				parameter = parameter + 1;
			}else if(sigunguCode.equals( "금서구")) {
				parameter = parameter + 2;
			}else if(sigunguCode.equals( "기장군")) {
				parameter = parameter + 3;
			}else if(sigunguCode.equals( "남구")) {
				parameter = parameter + 4;
			}else if(sigunguCode.equals( "동구")) {
				parameter = parameter + 5;
			}else if(sigunguCode.equals( "동래구")) {
				parameter = parameter + 6;
			}else if(sigunguCode.equals( "부산진구")) {
				parameter = parameter + 7;
			}else if(sigunguCode.equals( "북구")) {
				parameter = parameter + 8;
			}else if(sigunguCode.equals( "사상구")) {
				parameter = parameter + 9;
			}else if(sigunguCode.equals( "사하구")) {
				parameter = parameter + 10;
			}else if(sigunguCode.equals( "서구")) {
				parameter = parameter + 11;
			}else if(sigunguCode.equals( "수영구")) {
				parameter = parameter + 12;
			}else if(sigunguCode.equals( "연제구")) {
				parameter = parameter + 13;
			}else if(sigunguCode.equals( "영도구")) {
				parameter = parameter + 14;
			}else if(sigunguCode.equals( "중구")) {
				parameter = parameter + 15;
			}else if(sigunguCode.equals( "해운대구")) {
				parameter = parameter + 16;
			} 
		}else if(areaCode.equals("7")) { //areaCode가 울산일때
			if(sigunguCode.equals( "중구")) {
				parameter = parameter + 1;
			}else if(sigunguCode.equals( "남구")) {
				parameter = parameter + 2;
			}else if(sigunguCode.equals( "동구")) {
				parameter = parameter + 3;
			}else if(sigunguCode.equals( "북구")) {
				parameter = parameter + 4;
			}else if(sigunguCode.equals( "울주군")) {
				parameter = parameter + 5;
			}
		}else if(areaCode.equals("8")) { //areaCode가 세종특별자치시일때
			if(sigunguCode.equals( "세종특별자치시")) {
				parameter = parameter + 1;
			}
		}else if(areaCode.equals("31")) { //areaCode가  경기도일때
			if(sigunguCode.equals( "가평군")) {
				parameter = parameter + 1;
			}else if(sigunguCode.equals( "고양시")) {
				parameter = parameter + 2;
			}else if(sigunguCode.equals( "과천시")) {
				parameter = parameter + 3;
			}else if(sigunguCode.equals( "광명시")) {
				parameter = parameter + 4;
			}else if(sigunguCode.equals( "광주시")) {
				parameter = parameter + 5;
			}else if(sigunguCode.equals( "구리시")) {
				parameter = parameter + 6;
			}else if(sigunguCode.equals( "군포시")) {
				parameter = parameter + 7;
			}else if(sigunguCode.equals( "김포시")) {
				parameter = parameter + 8;
			}else if(sigunguCode.equals( "남양주시")) {
				parameter = parameter + 9;
			}else if(sigunguCode.equals( "동두천시")) {
				parameter = parameter + 10;
			}else if(sigunguCode.equals( "부천시")) {
				parameter = parameter + 11;
			}else if(sigunguCode.equals( "성남시")) {
				parameter = parameter + 12;
			}else if(sigunguCode.equals( "수원시")) {
				parameter = parameter + 13;
			}else if(sigunguCode.equals( "시흥시")) {
				parameter = parameter + 14;
			}else if(sigunguCode.equals( "안산시")) {
				parameter = parameter + 15;
			}else if(sigunguCode.equals( "안성시")) {
				parameter = parameter + 16;
			}else if(sigunguCode.equals( "안양시")) {
				parameter = parameter + 17;
			}else if(sigunguCode.equals( "양주시")) {
				parameter = parameter + 18;
			}else if(sigunguCode.equals( "양평군")) {
				parameter = parameter + 19;
			}else if(sigunguCode.equals( "여주시")) {
				parameter = parameter + 20;
			}else if(sigunguCode.equals( "연천군")) {
				parameter = parameter + 21;
			}else if(sigunguCode.equals( "오산시")) {
				parameter = parameter + 22;
			}else if(sigunguCode.equals( "용인시")) {
				parameter = parameter + 23;
			}else if(sigunguCode.equals( "의왕시")) {
				parameter = parameter + 24;
			}else if(sigunguCode.equals( "의정부시")) {
				parameter = parameter + 25;
			}else if(sigunguCode.equals( "이천시")) {
				parameter = parameter + 26;
			}else if(sigunguCode.equals( "파주시")) {
				parameter = parameter + 27;
			}else if(sigunguCode.equals( "평택시")) {
				parameter = parameter + 28;
			}else if(sigunguCode.equals( "포천시")) {
				parameter = parameter + 29;
			}else if(sigunguCode.equals( "하남시")) {
				parameter = parameter + 30;
			}else if(sigunguCode.equals( "화성시")) {
				parameter = parameter + 31;
			}
		}else if(areaCode.equals("32")) { //areaCode가 강원도일때
			if(sigunguCode.equals( "강릉시")) {
				parameter = parameter + 1;
			}else if(sigunguCode.equals( "고성군")) {
				parameter = parameter + 2;
			}else if(sigunguCode.equals( "동해시")) {
				parameter = parameter + 3;
			}else if(sigunguCode.equals( "삼척시")) {
				parameter = parameter + 4;
			}else if(sigunguCode.equals( "속초시")) {
				parameter = parameter + 5;
			}else if(sigunguCode.equals( "양구군")) {
				parameter = parameter + 6;
			}else if(sigunguCode.equals( "양양군")) {
				parameter = parameter + 7;
			}else if(sigunguCode.equals( "영월군")) {
				parameter = parameter + 8;
			}else if(sigunguCode.equals( "원주시")) {
				parameter = parameter + 9;
			}else if(sigunguCode.equals( "인제군")) {
				parameter = parameter + 10;
			}else if(sigunguCode.equals( "정선군")) {
				parameter = parameter + 11;
			}else if(sigunguCode.equals( "철원군")) {
				parameter = parameter + 12;
			}else if(sigunguCode.equals( "춘천시")) {
				parameter = parameter + 13;
			}else if(sigunguCode.equals( "태백시")) {
				parameter = parameter + 14;
			}else if(sigunguCode.equals( "평창군")) {
				parameter = parameter + 15;
			}else if(sigunguCode.equals( "홍천군")) {
				parameter = parameter + 16;
			}else if(sigunguCode.equals( "화천군")) {
				parameter = parameter + 17;
			}else if(sigunguCode.equals( "횡성군")) {
				parameter = parameter + 18;
			}
		}else if(areaCode.equals("33")) { //areaCode가 충청북도일떄
			if(sigunguCode.equals( "괴산군")) {
				parameter = parameter + 1;
			}else if(sigunguCode.equals( "단양군")) {
				parameter = parameter + 2;
			}else if(sigunguCode.equals( "보은군")) {
				parameter = parameter + 3;
			}else if(sigunguCode.equals( "영동군")) {
				parameter = parameter + 4;
			}else if(sigunguCode.equals( "옥천군")) {
				parameter = parameter + 5;
			}else if(sigunguCode.equals( "음성군")) {
				parameter = parameter + 6;
			}else if(sigunguCode.equals( "제천시")) {
				parameter = parameter + 7;
			}else if(sigunguCode.equals( "진천군")) {
				parameter = parameter + 8;
			}else if(sigunguCode.equals( "청원군")) {
				parameter = parameter + 9;
			}else if(sigunguCode.equals( "청주시")) {
				parameter = parameter + 10;
			}else if(sigunguCode.equals( "충주시")) {
				parameter = parameter + 11;
			}else if(sigunguCode.equals( "증평군")) {
				parameter = parameter + 12;
			}
		}else if(areaCode.equals("34")) { //areaCode가 충청남도일때
			if(sigunguCode.equals( "공주시")) {
				parameter = parameter + 1;
			}else if(sigunguCode.equals( "금산군")) {
				parameter = parameter + 2;
			}else if(sigunguCode.equals( "논산시")) {
				parameter = parameter + 3;
			}else if(sigunguCode.equals( "당진시")) {
				parameter = parameter + 4;
			}else if(sigunguCode.equals( "보령시")) {
				parameter = parameter + 5;
			}else if(sigunguCode.equals( "부여군")) {
				parameter = parameter + 6;
			}else if(sigunguCode.equals( "서산시")) {
				parameter = parameter + 7;
			}else if(sigunguCode.equals( "서천군")) {
				parameter = parameter + 8;
			}else if(sigunguCode.equals( "아산시")) {
				parameter = parameter + 9;
			}else if(sigunguCode.equals( "예산군")) {
				parameter = parameter + 11;
			}else if(sigunguCode.equals( "천안시")) {
				parameter = parameter + 12;
			}else if(sigunguCode.equals( "청양군")) {
				parameter = parameter + 13;
			}else if(sigunguCode.equals( "태안군")) {
				parameter = parameter + 14;
			}else if(sigunguCode.equals( "홍성군")) {
				parameter = parameter + 15;
			}else if(sigunguCode.equals( "계룡시")) {
				parameter = parameter + 16;
			}
		}else if(areaCode.equals("35")) { //areaCode가 경상북도일때
			if(sigunguCode.equals( "경산시")) {
				parameter = parameter + 1;
			}else if(sigunguCode.equals( "경주시")) {
				parameter = parameter + 2;
			}else if(sigunguCode.equals( "고령군")) {
				parameter = parameter + 3;
			}else if(sigunguCode.equals( "구미시")) {
				parameter = parameter + 4;
			}else if(sigunguCode.equals( "군위군")) {
				parameter = parameter + 5;
			}else if(sigunguCode.equals( "김천시")) {
				parameter = parameter + 6;
			}else if(sigunguCode.equals( "문경시")) {
				parameter = parameter + 7;
			}else if(sigunguCode.equals( "봉화군")) {
				parameter = parameter + 8;
			}else if(sigunguCode.equals( "상주시")) {
				parameter = parameter + 9;
			}else if(sigunguCode.equals( "성주군")) {
				parameter = parameter + 11;
			}else if(sigunguCode.equals( "안동시")) {
				parameter = parameter + 12;
			}else if(sigunguCode.equals( "영덕군")) {
				parameter = parameter + 13;
			}else if(sigunguCode.equals( "영양군")) {
				parameter = parameter + 14;
			}else if(sigunguCode.equals( "영주시")) {
				parameter = parameter + 15;
			}else if(sigunguCode.equals( "영천시")) {
				parameter = parameter + 16;
			}else if(sigunguCode.equals( "예천군")) {
				parameter = parameter + 17;
			}else if(sigunguCode.equals( "울릉군")) {
				parameter = parameter + 18;
			}else if(sigunguCode.equals( "울진군")) {
				parameter = parameter + 19;
			}else if(sigunguCode.equals( "의성군")) {
				parameter = parameter + 20;
			}else if(sigunguCode.equals( "청도군")) {
				parameter = parameter + 21;
			}else if(sigunguCode.equals( "청송군")) {
				parameter = parameter + 22;
			}else if(sigunguCode.equals( "칠곡군")) {
				parameter = parameter + 23;
			}else if(sigunguCode.equals( "포항시")) {
				parameter = parameter + 24;
			}
		}else if(areaCode.equals("36")) { //areaCode가 경상남도일때
			if(sigunguCode.equals( "거제시")) {
				parameter = parameter + 1;
			}else if(sigunguCode.equals( "거창군")) {
				parameter = parameter + 2;
			}else if(sigunguCode.equals( "고성군")) {
				parameter = parameter + 3;
			}else if(sigunguCode.equals( "김해시")) {
				parameter = parameter + 4;
			}else if(sigunguCode.equals( "남해군")) {
				parameter = parameter + 5;
			}else if(sigunguCode.equals( "마산시")) {
				parameter = parameter + 6;
			}else if(sigunguCode.equals( "밀양시")) {
				parameter = parameter + 7;
			}else if(sigunguCode.equals( "사천시")) {
				parameter = parameter + 8;
			}else if(sigunguCode.equals( "산청군")) {
				parameter = parameter + 9;
			}else if(sigunguCode.equals( "양산시")) {
				parameter = parameter + 10;
			}else if(sigunguCode.equals( "의령군")) {
				parameter = parameter + 12;
			}else if(sigunguCode.equals( "진주시")) {
				parameter = parameter + 13;
			}else if(sigunguCode.equals( "진해시")) {
				parameter = parameter + 14;
			}else if(sigunguCode.equals( "창녕군")) {
				parameter = parameter + 15;
			}else if(sigunguCode.equals( "창원시")) {
				parameter = parameter + 16;
			}else if(sigunguCode.equals( "통영시")) {
				parameter = parameter + 17;
			}else if(sigunguCode.equals( "하동군")) {
				parameter = parameter + 18;
			}else if(sigunguCode.equals( "함안군")) {
				parameter = parameter + 19;
			}else if(sigunguCode.equals( "함양군")) {
				parameter = parameter + 20;
			}else if(sigunguCode.equals( "합천군")) {
				parameter = parameter + 21;
			}
		}else if(areaCode.equals( "37")) { //areaCode가 전라북도일때
			if(sigunguCode.equals( "고창군")) {
				parameter = parameter + 1;
			}else if(sigunguCode.equals( "군산시")) {
				parameter = parameter + 2;
			}else if(sigunguCode.equals( "김제시")) {
				parameter = parameter + 3;
			}else if(sigunguCode.equals( "남원시")) {
				parameter = parameter + 4;
			}else if(sigunguCode.equals( "무주군")) {
				parameter = parameter + 5;
			}else if(sigunguCode.equals( "부안군")) {
				parameter = parameter + 6;
			}else if(sigunguCode.equals( "순창군")) {
				parameter = parameter + 7;
			}else if(sigunguCode.equals( "완주군")) {
				parameter = parameter + 8;
			}else if(sigunguCode.equals( "익산시")) {
				parameter = parameter + 9;
			}else if(sigunguCode.equals( "임실군")) {
				parameter = parameter + 10;
			}else if(sigunguCode.equals( "장수군")) {
				parameter = parameter + 11;
			}else if(sigunguCode.equals( "전주시")) {
				parameter = parameter + 12;
			}else if(sigunguCode.equals( "정읍시")) {
				parameter = parameter + 13;
			}else if(sigunguCode.equals( "진안군")) {
				parameter = parameter + 14;
			}
		}else if(areaCode.equals( "38")) { //areaCode가 전라남도일대
			if(sigunguCode.equals( "강진군")) {
				parameter = parameter + 1;
			}else if(sigunguCode.equals( "고흥군")) {
				parameter = parameter + 2;
			}else if(sigunguCode.equals( "공성군")) {
				parameter = parameter + 3;
			}else if(sigunguCode.equals( "광양시")) {
				parameter = parameter + 4;
			}else if(sigunguCode.equals( "구례군")) {
				parameter = parameter + 5;
			}else if(sigunguCode.equals( "나주시")) {
				parameter = parameter + 6;
			}else if(sigunguCode.equals( "담양군")) {
				parameter = parameter + 7;
			}else if(sigunguCode.equals( "목포시")) {
				parameter = parameter + 8;
			}else if(sigunguCode.equals( "무안군")) {
				parameter = parameter + 9;
			}else if(sigunguCode.equals( "보성군")) {
				parameter = parameter + 10;
			}else if(sigunguCode.equals( "순천시")) {
				parameter = parameter + 11;
			}else if(sigunguCode.equals( "신안군")) {
				parameter = parameter + 12;
			}else if(sigunguCode.equals( "여수시")) {
				parameter = parameter + 13;
			}else if(sigunguCode.equals( "영광군")) {
				parameter = parameter + 16;
			}else if(sigunguCode.equals( "영암군")) {
				parameter = parameter + 17;
			}else if(sigunguCode.equals( "완도군")) {
				parameter = parameter + 18;
			}else if(sigunguCode.equals( "장성군")) {
				parameter = parameter + 19;
			}else if(sigunguCode.equals( "장흥군")) {
				parameter = parameter + 20;
			}else if(sigunguCode.equals( "진도군")) {
				parameter = parameter + 21;
			}else if(sigunguCode.equals( "함평군")) {
				parameter = parameter + 22;
			}else if(sigunguCode.equals( "해남군")) {
				parameter = parameter + 23;
			}else if(sigunguCode.equals( "화순군")) {
				parameter = parameter + 24;
			}
		}else if(areaCode.equals("39")) { //areaCode가 제주도 일때
			if(sigunguCode.equals( "남제주군")) {
				parameter = parameter + 1;
			}else if(sigunguCode.equals( "북제주군")) {
				parameter = parameter + 2;
			}else if(sigunguCode.equals( "서귀포시")) {
				parameter = parameter + 3;
			}else if(sigunguCode.equals( "제주시")) {
				parameter = parameter + 4;
			}
		}
		
		parameter = parameter + "&" + "pageNo=1&numOfRows=300"; //페이지번호,한페이지 검색 결과 수
		parameter = parameter + "&" + "MobileOS=ETC"; 			//필수 os구분
		parameter = parameter + "&" + "MobileApp=gabom"; 		//필수 서비스명
		parameter = parameter + "&" + "_type=json";				//제이슨 타입으로 받음
		
		
		addr = addr + serviceKey + parameter;
		
		String json = null;
		try {
			
			URL url  = new URL(addr);
			InputStream in;
			try {
				in = url.openStream();
				ByteArrayOutputStream  bos1 = new ByteArrayOutputStream();	//InputStream의 데이터들을 바이트 배열로 저장
				IOUtils.copy(in, bos1);	//데이터를 바이트 배열로 복사
				in.close();
				bos1.close();
				json = bos1.toString();
				
			} catch (IOException e) {
				e.printStackTrace();
			} 	//URL로 부터 자바로 데이터 읽어오도록 URL객체로 스트림 열기
			
		
		} catch (MalformedURLException e) {
			e.printStackTrace();
		}
		
		String resultJson;
		try {
			ObjectMapper mapper =new ObjectMapper();
			
			TripAreaBasedresponse areabasedlist = mapper.readValue(json, TripAreaBasedresponse.class);
			
			List<TripAreaBasedList> result = areabasedlist.getResponse().getBody().getItems().getItem();
			
			List<TripAreaBasedList> result1 = new ArrayList<TripAreaBasedList>();
			TripAreaBasedList innerDto = new TripAreaBasedList();
			
			for( TripAreaBasedList field : result) {
				if(field.getFirstimage().equals("없음")==false) {
					innerDto = field;
					result1.add(innerDto);
					innerDto=new TripAreaBasedList();
				}
			}
			
			resultJson = new Gson().toJson(result1);
			
			return resultJson;     // 이놈이 최종값임
		} catch (MismatchedInputException e) {
			throw new NoTouristSpotException("검색결과가 없습니다..");
		}
		
	}

}
