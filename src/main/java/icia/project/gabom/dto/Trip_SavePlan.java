package icia.project.gabom.dto;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.type.Alias;
import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;
import lombok.experimental.Accessors;

@Alias("trip_saveplan")
@Data
@Accessors(chain=true)
public class Trip_SavePlan {
	
	private int tripnum;
	private List<Date> rangedate; 
	
	
}
