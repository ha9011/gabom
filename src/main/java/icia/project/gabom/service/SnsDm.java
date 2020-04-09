package icia.project.gabom.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
		List<SnsDmDto> newContents= new ArrayList<SnsDmDto>();
		List<List<SnsDmDto>> result=new ArrayList<List<SnsDmDto>>();
		List<SnsDmDto> readCnt= new ArrayList<SnsDmDto>();
		if(dmList.size()==0) {
			//메세지함에 보낸이가 없으면
			JsonObject resultOb=new JsonObject();
			resultOb.addProperty("message", "메세지가 없습니다");
			return new Gson().toJson(resultOb);
		}else {
			//가져와야 할 목록 읽음 안읽음 표시 추가 안읽음 카운트 최신 내용 row1 
			SimpleDateFormat format1= new SimpleDateFormat("yyyy-MM-dd HH:mm");
			for(SnsDmDto dm : dmList) {
				newContents=snsDmDao.getNewContent(id,dm.getSendMember());
				for(int i=0;i<newContents.size();i++) {
					readCnt=snsDmDao.getNewCnt(id,dm.getSendMember());
					String dmDate=format1.format(newContents.get(i).getDmDate());
					newContents.get(i).setDmDateRsult(dmDate);
					if(readCnt.get(i)==null) {
						newContents.get(i).setCheckNum(0);
					}else {
						newContents.get(i).setCheckNum(readCnt.get(i).getCheckNum());
					}
					result.add(newContents);
				}
			}
		}
		return new Gson().toJson(result);
		
	}
	@Transactional
	public String dmdetail(String userId, String id) {
		System.out.println("받아옴"+userId);
		//전부다 읽음으로 바꿔야함 order by 해야함 날짜별로 
		snsDmDao.checkRead(userId,id);
		List<SnsDmDto> dmContentsList=snsDmDao.getContets(userId,id);
		SimpleDateFormat format= new SimpleDateFormat("yyyy-MM-dd HH:mm");
		for(SnsDmDto snsDm:dmContentsList) {
			String result=format.format(snsDm.getDmDate());
			snsDm.setResultDate(result);
		}
		return new Gson().toJson(dmContentsList);
	}
	
	
	
	public String dmInsert(String contents, String name, String userId) {
		boolean result=snsDmDao.insertDm(contents,name,userId);
		if(result==true) {
			List<SnsDmDto> dmContentsList=snsDmDao.getContets(userId,name);
			SimpleDateFormat format= new SimpleDateFormat("yyyy-MM-dd HH:mm");
			for(SnsDmDto snsDm:dmContentsList) {
				String dResult=format.format(snsDm.getDmDate());
				snsDm.setResultDate(dResult);
			}
			return new Gson().toJson(dmContentsList);
		}else {
			JsonObject resultOb=new JsonObject();
			resultOb.addProperty("message", "오류");
			return new Gson().toJson(resultOb);
		}
	}
	public String dmDelete(int num, String id, String userId) {
		boolean result=snsDmDao.deleteDm(num);
		if(result==true) {
			List<SnsDmDto> dmContentsList=snsDmDao.getContets(userId,id);
			SimpleDateFormat format= new SimpleDateFormat("yyyy-MM-dd HH:mm");
			for(SnsDmDto snsDm:dmContentsList) {
				String dResult=format.format(snsDm.getDmDate());
				snsDm.setResultDate(dResult);
			}
			return new Gson().toJson(dmContentsList);
		}else {
			JsonObject resultOb=new JsonObject();
			resultOb.addProperty("message", "오류");
			return new Gson().toJson(resultOb);
		}
	}

}
