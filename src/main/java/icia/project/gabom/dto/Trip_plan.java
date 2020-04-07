package icia.project.gabom.dto;

import org.apache.ibatis.type.Alias;
import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;
import lombok.experimental.Accessors;

@Alias("trip")
@Data
@Accessors(chain=true)
public class Trip_plan {
	
	private int trip_number;
	private String trip_id;
	private String trip_title;
	private String trip_area;
	
	@DateTimeFormat(pattern="yyyy-mm-dd")
	private String trip_start_date;
	
	@DateTimeFormat(pattern="yyyy-mm-dd")
	private String trip_end_date;
	
	@DateTimeFormat(pattern="yyyy-mm-dd")
	private String trip_date;
	
	private int trip_day;
	
	private int trip_plan_appry_status = 0;
	
	private int trip_share_count;

}
