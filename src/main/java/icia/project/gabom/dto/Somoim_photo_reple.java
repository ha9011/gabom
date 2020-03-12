package icia.project.gabom.dto;

import org.apache.ibatis.type.Alias;
import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;
import lombok.experimental.Accessors;

@Alias("spreple")
@Data
@Accessors(chain=true)
public class Somoim_photo_reple {
	
	private int reply_number;
	private int photo_number;
	private int somoim_number;
	private String reply_id;
	private String reply_content;
	
	
		
	@DateTimeFormat(pattern="yyyy-mm-dd")
	private String reply_date;
	
	@DateTimeFormat(pattern="yyyy-mm-dd")
	private String reply_update;
	
	

}
