package icia.project.gabom.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import icia.project.gabom.dao.SnsPostSecurityDao;

@Service
public class SnsPostSecurity {

	@Autowired
	SnsPostSecurityDao snsPostSecurityDao;

	public String edit(int postNumber, int securityVal) {

		boolean result = snsPostSecurityDao.edit(postNumber, securityVal);
		JsonObject securityEditObj = new JsonObject();
		System.out.println("시큐리티 다녀옴" + result);
		if (result) {
			securityEditObj.addProperty("message", "설정이 변경 되었습니다.");
		} else {
			securityEditObj.addProperty("message", "오류");
		}
		return new Gson().toJson(securityEditObj);
	}

}
