package icia.project.gabom.dto;


import java.sql.Date;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.experimental.Accessors;

@Alias("somoim")
@Accessors(chain=true)
@Data
public class Somoim {
	private int somoim_number;
	private String somoim_maker;
	private String somoim_name;
	private String somoim_introduce;
	private String somoim_location;
	private String somoim_detail_location;
	private String somoim_interest;
	private String somoim_person;
	private String somoim_mainpicture;
	private Date somoim_date;

	private String somoim_sys_mainpicture;  // 파일 경로
}
