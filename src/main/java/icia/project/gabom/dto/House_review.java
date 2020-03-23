package icia.project.gabom.dto;

import org.apache.ibatis.type.Alias;
import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;
import lombok.experimental.Accessors;

@Alias("hreview")
@Data
@Accessors(chain=true)
public class House_review {
	
	private int house_review_number;
	private int house_number;
	private String member_guestid;
	private String house_review_content;
	
	@DateTimeFormat(pattern="yyyy-mm-dd")
	private String house_review_date;
	
	//후기 사진 
	private String house_review_orifile;
	private String house_review_sysfile;
}
