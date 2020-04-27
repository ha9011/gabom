package icia.project.gabom.service;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.MalformedURLException;
import java.net.URL;

import org.apache.commons.io.IOUtils;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

@Service
public class TripApiService {

	private ModelAndView mav;

	public String getdetailCommon(String contentid) {

		String addr = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?ServiceKey=";
		String serviceKey = "%2B%2BXC1MAaQv2wQPBU5ZLVxzXuxpix4TpZqHJvYRBf4hHytxBnkk%2B227wTPvDoN8BrUyVEKMtvsdeHKmbRKmZz%2BQ%3D%3D"; // 인증키
		String parameter = "";

		parameter = parameter + "&" + "contentId=" + contentid; // 지역코드(변경되는 부분)
		parameter = parameter + "&" + "MobileOS=ETC"; // 필수 os구분
		parameter = parameter + "&" + "MobileApp=gabom"; // 필수 서비스명
		parameter = parameter + "&" + "defaultYN=Y"; //기본정보 조회
		parameter = parameter + "&" + "firstImageYN=Y"; //대표이미지 조회
		parameter = parameter + "&" + "areacodeYN=Y"; //지역코드 조회
		parameter = parameter + "&" + "catcodeYN=Y"; //서비스분류코드 조회
		parameter = parameter + "&" + "addrinfoYN=Y"; //주소 조회
		parameter = parameter + "&" + "mapinfoYN=Y"; //좌표조회
		parameter = parameter + "&" + "overviewYN=Y"; //개요 조회
		parameter = parameter + "&" + "transGuideYN=Y"; //모르겠지만 사이트에 추가되있음
		parameter = parameter + "&" + "_type=json"; // 제이슨 타입으로 받음

		addr = addr + serviceKey + parameter;

		String json = null;
		try {

			URL url = new URL(addr);
			InputStream in;
			try {
				in = url.openStream();
				ByteArrayOutputStream bos1 = new ByteArrayOutputStream(); // InputStream의 데이터들을 바이트 배열로 저장
				IOUtils.copy(in, bos1); // 데이터를 바이트 배열로 복사
				in.close();
				bos1.close();

				json = bos1.toString();


			} catch (IOException e) {
				e.printStackTrace();
			} // URL로 부터 자바로 데이터 읽어오도록 URL객체로 스트림 열기

		} catch (MalformedURLException e) {
			e.printStackTrace();
		}

		String resultJson = new Gson().toJson(json);
		return resultJson;
	}

}
