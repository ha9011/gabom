package icia.project.gabom.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;

import icia.project.gabom.dao.SnsDmDao;
import icia.project.gabom.dto.SnsDmDto;

@Service
public class SnsDm {

	@Autowired
	SnsDmDao snsDmDao;
	
	
	public String dm(String id) {
		List<SnsDmDto> dmList=snsDmDao.getDmList(id);
		return new Gson().toJson(dmList);
	}

}
