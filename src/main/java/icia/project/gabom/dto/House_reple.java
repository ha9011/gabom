package icia.project.gabom.dto;

import org.apache.ibatis.type.Alias;
import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;
import lombok.experimental.Accessors;

@Alias("h_reple")
@Data
@Accessors(chain=true)
public class House_reple {
	
	private int house_reple_number;
	private int house_number;
	private String member_guestid;
	private String house_reple_content;
	
	@DateTimeFormat(pattern="yyyy-mm-dd")
	private String house_reple_time;
}
