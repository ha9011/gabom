package icia.project.gabom.dto;

import java.util.List;

import org.apache.ibatis.type.Alias;
import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;
import lombok.experimental.Accessors;


@Alias("somoimmyinfo")
@Data
@Accessors(chain=true)
public class SomoimMyInfo {
	private String member_profile_picture;
	private String somoim_number;
	private String member_name;
	private int member_status = 0 ;
	private int member_grade = 0;
	
}
