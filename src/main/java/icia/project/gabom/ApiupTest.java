package icia.project.gabom;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.net.MalformedURLException;
import java.net.URL;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import icia.project.gabom.service.AdminjudgeManagement;

@RestController
public class ApiupTest {

	@Autowired
	private AdminjudgeManagement am; //관리자

	
	@RequestMapping(value = "/apiuptest", method = RequestMethod.GET, produces = "text/plain;charset=utf-8")
	public String apiuptest() {
		System.out.println("apiuptest 들어왔나?");
		
			
		String addr = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?ServiceKey=";
		String serviceKey = "%2B%2BXC1MAaQv2wQPBU5ZLVxzXuxpix4TpZqHJvYRBf4hHytxBnkk%2B227wTPvDoN8BrUyVEKMtvsdeHKmbRKmZz%2BQ%3D%3D"; //인증키
		String parameter = "";

		parameter = parameter + "&" + "areaCode=39"; // + areaCode; //지역코드(변경되는 부분)
		parameter = parameter + "&" + "pageNo=1&numOfRows=10"; //페이지번호,한페이지 검색 결과 수
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


		
//		json.put("data", data);
		
		
		String resultJson = new Gson().toJson(json);
		System.out.println("resultJson : " + resultJson);
		return resultJson;
	}
}
