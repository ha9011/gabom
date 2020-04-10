package icia.project.gabom.dto;

import org.apache.ibatis.type.Alias;
import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;
import lombok.experimental.Accessors;

@Alias("trfriend")
@Data
@Accessors(chain=true)
public class Trip_member {
	private String share_id;
	private int trip_number;
	private int trip_type;
	private String trip_title;
	private String trip_id;
	private String trip_area;
	
	@DateTimeFormat(pattern="yyyy-mm-dd")
	private String trip_start_date;
	
	@DateTimeFormat(pattern="yyyy-mm-dd")
	private String trip_end_date;
	
	private Trip_plan trip;
	
	private int trip_plan_appry_status = 0;
	
	//여행에서 친구 이름 , 사진 가져옴 
		private String member_name;
		private String member_profile_picture;
}
