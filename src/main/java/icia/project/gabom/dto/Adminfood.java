package icia.project.gabom.dto;

import org.apache.ibatis.type.Alias;
import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;
import lombok.experimental.Accessors;

@Alias("adminfood")
@Data
@Accessors(chain=true)
public class Adminfood {
	private int food_number;
	private String food_hostid;
	private String food_name;
	private String food_address;
	private int food_parkable;
	private int food_person;
	private int food_type;
	private int food_granttype;
	private String food_xpoint;
	private String food_ypoint;
	
	@DateTimeFormat(pattern="yyyy-mm-dd")
	private String food_mindate;
	
	@DateTimeFormat(pattern="yyyy-mm-dd")
	private String food_maxdate;
	
	@DateTimeFormat(pattern="HH:mm:ss")
	private String food_mintime;
	@DateTimeFormat(pattern="HH:mm:ss")
	private String food_maxtime;
	
	private int food_imagetype;
	private String food_oriname;
	private String food_sysname;
}
