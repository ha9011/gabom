package icia.project.gabom;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.forwardedUrl;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;

import icia.project.gabom.dto.Apisearch;
import icia.project.gabom.dto.TripAreaBasedList;
import icia.project.gabom.dto.TripAreaBasedresponse;
import icia.project.gabom.service.AdminjudgeManagement;

@RestController
public class RestApiController {

	@Autowired
	private AdminjudgeManagement am; //관리자

	
	@RequestMapping(value = "/apisearch", method = RequestMethod.GET, produces = "text/plain;charset=utf-8")
	public String apiuptest(@RequestParam("areaCode") String areaCode) throws JsonMappingException, JsonProcessingException {//, @RequestParam("sigunguCode") String sigunguCode
		//String areaCode = areaCode;
		//String areaCode = null;
		//System.out.println("apiuptest 들어왔나?" + apisearch.toString());
		System.out.println("areaCode는 잘 들고왓니??"+areaCode);
			
		String addr = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?ServiceKey=";
		String serviceKey = "%2B%2BXC1MAaQv2wQPBU5ZLVxzXuxpix4TpZqHJvYRBf4hHytxBnkk%2B227wTPvDoN8BrUyVEKMtvsdeHKmbRKmZz%2BQ%3D%3D"; //인증키
		String parameter = "";
		parameter = parameter + "&" + "contentTypeId=12";
		parameter = parameter + "&" + "areaCode="+areaCode;  //지역코드(변경되는 부분)
		parameter = parameter + "&" + "sigunguCode=3"; //시군구 코드 
		
//		if(areaCode == "1") { //areaCode가 서울일때
//			if(sigunguCode == "강남구") {
//				parameter = parameter + 1;
//			}else if(sigunguCode == "강동구") {
//				parameter = parameter + 2;
//			}else if(sigunguCode == "강북구") {
//				parameter = parameter + 3;
//			}else if(sigunguCode == "강서구") {
//				parameter = parameter + 4;
//			}else if(sigunguCode == "관악구") {
//				parameter = parameter + 5;
//			}else if(sigunguCode == "광진구") {
//				parameter = parameter + 6;
//			}else if(sigunguCode == "구로구") {
//				parameter = parameter + 7;
//			}else if(sigunguCode == "금천구") {
//				parameter = parameter + 8;
//			}else if(sigunguCode == "노원구") {
//				parameter = parameter + 9;
//			}else if(sigunguCode == "도봉구") {
//				parameter = parameter + 10;
//			}else if(sigunguCode == "동대문구") {
//				parameter = parameter + 11;
//			}else if(sigunguCode == "동작구") {
//				parameter = parameter + 12;
//			}else if(sigunguCode == "마포구") {
//				parameter = parameter + 13;
//			}else if(sigunguCode == "서대문구") {
//				parameter = parameter + 14;
//			}else if(sigunguCode == "서초구") {
//				parameter = parameter + 15;
//			}else if(sigunguCode == "성동구") {
//				parameter = parameter + 16;
//			}else if(sigunguCode == "성북구") {
//				parameter = parameter + 17;
//			}else if(sigunguCode == "송파구") {
//				parameter = parameter + 18;
//			}else if(sigunguCode == "양천구") {
//				parameter = parameter + 19;
//			}else if(sigunguCode == "영등포구") {
//				parameter = parameter + 20;
//			}else if(sigunguCode == "용산구") {
//				parameter = parameter + 21;
//			}else if(sigunguCode == "은평구") {
//				parameter = parameter + 22;
//			}else if(sigunguCode == "종로구") {
//				parameter = parameter + 23;
//			}else if(sigunguCode == "중구") {
//				parameter = parameter + 24;
//			}else if(sigunguCode == "중랑구") {
//				parameter = parameter + 25;
//			}
//		}else if(areaCode == "2") { //areaCode가 인천일때
//			if(sigunguCode == "강화군") {
//				parameter = parameter + 1;
//			}else if(sigunguCode == "계양구") {
//				parameter = parameter + 2;
//			}else if(sigunguCode == "미추홀구") {
//				parameter = parameter + 3;
//			}else if(sigunguCode == "남동구") {
//				parameter = parameter + 4;
//			}else if(sigunguCode == "동구") {
//				parameter = parameter + 5;
//			}else if(sigunguCode == "부평구") {
//				parameter = parameter + 6;
//			}else if(sigunguCode == "서구") {
//				parameter = parameter + 7;
//			}else if(sigunguCode == "연수구") {
//				parameter = parameter + 8;
//			}else if(sigunguCode == "웅진군") {
//				parameter = parameter + 9;
//			}else if(sigunguCode == "중구") {
//				parameter = parameter + 10;
//			}
//		}else if(areaCode == "3") { //areaCode가 대전일때
//			if(sigunguCode == "대덕구") {
//				parameter = parameter + 1;
//			}else if(sigunguCode == "동구") {
//				parameter = parameter + 2;
//			}else if(sigunguCode == "서구") {
//				parameter = parameter + 3;
//			}else if(sigunguCode == "유성구") {
//				parameter = parameter + 4;
//			}else if(sigunguCode == "중구") {
//				parameter = parameter + 5;
//			}
//		}else if(areaCode == "4") { //areaCode가 대구일때
//			if(sigunguCode == "남구") {
//				parameter = parameter + 1;
//			}else if(sigunguCode == "달서구") {
//				parameter = parameter + 2;
//			}else if(sigunguCode == "달성군") {
//				parameter = parameter + 3;
//			}else if(sigunguCode == "동구") {
//				parameter = parameter + 4;
//			}else if(sigunguCode == "북구") {
//				parameter = parameter + 5;
//			}else if(sigunguCode == "서구") {
//				parameter = parameter + 6;
//			}else if(sigunguCode == "수성구") {
//				parameter = parameter + 7;
//			}else if(sigunguCode == "중구") {
//				parameter = parameter + 8;
//			}
//		}else if(areaCode == "5") { //areaCode가 광주일때
//			if(sigunguCode == "광산구") {
//				parameter = parameter + 1;
//			}else if(sigunguCode == "남구") {
//				parameter = parameter + 2;
//			}else if(sigunguCode == "동구") {
//				parameter = parameter + 3;
//			}else if(sigunguCode == "북구") {
//				parameter = parameter + 4;
//			}else if(sigunguCode == "서구") {
//				parameter = parameter + 5;
//			}
//		}else if(areaCode == "6") { //areaCode가 부산일때
//			if(sigunguCode == "강서구") {
//				parameter = parameter + 1;
//			}else if(sigunguCode == "금서구") {
//				parameter = parameter + 2;
//			}else if(sigunguCode == "기장군") {
//				parameter = parameter + 3;
//			}else if(sigunguCode == "남구") {
//				parameter = parameter + 4;
//			}else if(sigunguCode == "동구") {
//				parameter = parameter + 5;
//			}else if(sigunguCode == "동래구") {
//				parameter = parameter + 6;
//			}else if(sigunguCode == "부산진구") {
//				parameter = parameter + 7;
//			}else if(sigunguCode == "북구") {
//				parameter = parameter + 8;
//			}else if(sigunguCode == "사상구") {
//				parameter = parameter + 9;
//			}else if(sigunguCode == "사하구") {
//				parameter = parameter + 10;
//			}else if(sigunguCode == "서구") {
//				parameter = parameter + 11;
//			}else if(sigunguCode == "수영구") {
//				parameter = parameter + 12;
//			}else if(sigunguCode == "연제구") {
//				parameter = parameter + 13;
//			}else if(sigunguCode == "영도구") {
//				parameter = parameter + 14;
//			}else if(sigunguCode == "중구") {
//				parameter = parameter + 15;
//			}else if(sigunguCode == "해운대구") {
//				parameter = parameter + 16;
//			} 
//		}else if(areaCode == "7") { //areaCode가 울산일때
//			if(sigunguCode == "중구") {
//				parameter = parameter + 1;
//			}else if(sigunguCode == "남구") {
//				parameter = parameter + 2;
//			}else if(sigunguCode == "동구") {
//				parameter = parameter + 3;
//			}else if(sigunguCode == "북구") {
//				parameter = parameter + 4;
//			}else if(sigunguCode == "울주군") {
//				parameter = parameter + 5;
//			}
//		}else if(areaCode == "8") { //areaCode가 세종특별자치시일때
//			if(sigunguCode == "세종특별자치시") {
//				parameter = parameter + 1;
//			}
//		}else if(areaCode == "31") { //areaCode가  경기도일때
//			if(sigunguCode == "남제주군") {
//				parameter = parameter + 1;
//			}else if(sigunguCode == "북제주군") {
//				parameter = parameter + 2;
//			}else if(sigunguCode == "서귀포시") {
//				parameter = parameter + 3;
//			}else if(sigunguCode == "제주시") {
//				parameter = parameter + 4;
//			}
//		}else if(areaCode == "32") { //areaCode가 강원도일때
//			if(sigunguCode == "남제주군") {
//				parameter = parameter + 1;
//			}else if(sigunguCode == "북제주군") {
//				parameter = parameter + 2;
//			}else if(sigunguCode == "서귀포시") {
//				parameter = parameter + 3;
//			}else if(sigunguCode == "제주시") {
//				parameter = parameter + 4;
//			}
//		}else if(areaCode == "33") { //areaCode가 충청북도일떄
//			if(sigunguCode == "남제주군") {
//				parameter = parameter + 1;
//			}else if(sigunguCode == "북제주군") {
//				parameter = parameter + 2;
//			}else if(sigunguCode == "서귀포시") {
//				parameter = parameter + 3;
//			}else if(sigunguCode == "제주시") {
//				parameter = parameter + 4;
//			}
//		}else if(areaCode == "34") { //areaCode가 충청남도일때
//			if(sigunguCode == "남제주군") {
//				parameter = parameter + 1;
//			}else if(sigunguCode == "북제주군") {
//				parameter = parameter + 2;
//			}else if(sigunguCode == "서귀포시") {
//				parameter = parameter + 3;
//			}else if(sigunguCode == "제주시") {
//				parameter = parameter + 4;
//			}
//		}else if(areaCode == "35") { //areaCode가 경상북도일때
//			if(sigunguCode == "남제주군") {
//				parameter = parameter + 1;
//			}else if(sigunguCode == "북제주군") {
//				parameter = parameter + 2;
//			}else if(sigunguCode == "서귀포시") {
//				parameter = parameter + 3;
//			}else if(sigunguCode == "제주시") {
//				parameter = parameter + 4;
//			}
//		}else if(areaCode == "36") { //areaCode가 경상남도일때
//			if(sigunguCode == "남제주군") {
//				parameter = parameter + 1;
//			}else if(sigunguCode == "북제주군") {
//				parameter = parameter + 2;
//			}else if(sigunguCode == "서귀포시") {
//				parameter = parameter + 3;
//			}else if(sigunguCode == "제주시") {
//				parameter = parameter + 4;
//			}
//		}else if(areaCode == "37") { //areaCode가 전라북도일때
//			if(sigunguCode == "남제주군") {
//				parameter = parameter + 1;
//			}else if(sigunguCode == "북제주군") {
//				parameter = parameter + 2;
//			}else if(sigunguCode == "서귀포시") {
//				parameter = parameter + 3;
//			}else if(sigunguCode == "제주시") {
//				parameter = parameter + 4;
//			}
//		}else if(areaCode == "38") { //areaCode가 전라남도일대
//			if(sigunguCode == "남제주군") {
//				parameter = parameter + 1;
//			}else if(sigunguCode == "북제주군") {
//				parameter = parameter + 2;
//			}else if(sigunguCode == "서귀포시") {
//				parameter = parameter + 3;
//			}else if(sigunguCode == "제주시") {
//				parameter = parameter + 4;
//			}
//		}else if(areaCode == "39") { //areaCode가 제주도 일때
//			if(sigunguCode == "남제주군") {
//				parameter = parameter + 1;
//			}else if(sigunguCode == "북제주군") {
//				parameter = parameter + 2;
//			}else if(sigunguCode == "서귀포시") {
//				parameter = parameter + 3;
//			}else if(sigunguCode == "제주시") {
//				parameter = parameter + 4;
//			}
//		}
		parameter = parameter + "&" + "pageNo=1&numOfRows=300"; //페이지번호,한페이지 검색 결과 수
		parameter = parameter + "&" + "MobileOS=ETC"; 			//필수 os구분
		parameter = parameter + "&" + "MobileApp=gabom"; 		//필수 서비스명
		parameter = parameter + "&" + "_type=json";				//제이슨 타입으로 받음
		
		
		addr = addr + serviceKey + parameter;
		System.out.println(addr);
		
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
			    //System.out.println("bos1"+bos1.to());
			    
			    
//				String mbos = bos1.toString("UTF-8");
				json = bos1.toString();
				System.out.println("mbos: "+json);
				
			    
				//byte[] b = mbos.getBytes("UTF-8");
				//String s = new String(b, "UTF-8");	
//				out.println(s);
				
				//json= mbos;
				
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 	//URL로 부터 자바로 데이터 읽어오도록 URL객체로 스트림 열기
			
		
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

//		
//		ObjectMapper mapper = new ObjectMapper();
//		TripAreaBasedList[] areabasedlist = mapper.readValue(json, TripAreaBasedList[].class);
		ObjectMapper mapper =new ObjectMapper();
		TripAreaBasedresponse areabasedlist = mapper.readValue(json, TripAreaBasedresponse.class);
		List<TripAreaBasedList> result = areabasedlist.getResponse().getBody().getItems().getItem();
//		json.put("data", data);
		
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
		
		System.out.println("resultJson : " + resultJson);
		
		
		return resultJson;
	}
	

}
