package icia.project.gabom.dto;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.test.annotation.Timed;

import lombok.Data;
import lombok.experimental.Accessors;

@Alias("food")
@Data
@Accessors(chain=true)
public class Food {
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
	
	private Timestamp food_mindtime;
	
	private Timestamp food_maxtime;
}
