package icia.project.gabom.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import icia.project.gabom.dao.SnsPostReportDao;

@Service
public class SnsPostReport {

	@Autowired
	SnsPostReportDao snsPostReportDao;
	
	public String report(int postNumber) {
		
		boolean result=snsPostReportDao.report(postNumber);
		JsonObject resultOb= new JsonObject();
		if(result) {
			resultOb.addProperty("message", "신고가 접수 되었습니다");
		}else {
			resultOb.addProperty("message", "오류");
		}
		return new Gson().toJson(resultOb);
	}

}
