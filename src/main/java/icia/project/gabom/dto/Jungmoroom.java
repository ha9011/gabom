package icia.project.gabom.dto;

import java.sql.Date;

import org.apache.ibatis.type.Alias;
import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;
import lombok.Value;
import lombok.val;
import lombok.experimental.Accessors;

@Alias("jungmoroom")
@Data
@Accessors(chain=true)
public class Jungmoroom {
	private int jungmo_number;
	private int somoim_number;
	private String jungmo_name;
	
	private int my_attend_check;
	
	private String jungmo_xpoint; //JUNGMO_XPOINT 
	private String jungmo_ypoint; // JUNGMO_YPOINT
	
	@DateTimeFormat(pattern="yyyy-mm-dd")
	private String jungmo_date;
	private String jungmo_time;
	private String jungmo_location;
	private String jungmo_money;
	
	@DateTimeFormat(pattern="yyyy-mm-dd")
	private String jungmo_create_date;
	
	
	private String jungmo_join_id ; // 해당 정모에 참석한 친구의 아이디가 뜸
	
}
