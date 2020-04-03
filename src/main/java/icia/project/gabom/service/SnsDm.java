package icia.project.gabom.service;

import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import icia.project.gabom.dao.SnsDmDao;
import icia.project.gabom.dto.SnsDmDto;

@Service
public class SnsDm {

	@Autowired
	SnsDmDao snsDmDao;
	
	@Transactional
	public String dm(String id) {
		List<SnsDmDto> dmList=snsDmDao.check(id);
		if(dmList.size()==0) {
			//메세지함에 보낸이가 없으면
			JsonObject resultOb=new JsonObject();
			resultOb.addProperty("message", "메세지가 없습니다");
		}else {
			//가져와야 할 목록 읽음 안읽음 표시 추가 안읽음 카운트 최신 내용 row1 
			//SimpleDateFormat format= new SimpleDateFormat();
			for(SnsDmDto dm : dmList) {
				SnsDmDto newContents=snsDmDao.getNewContent(dm.getSendMember());
			}
			
		}
		
		
		
		return new Gson().toJson(dmList);
	}

}
