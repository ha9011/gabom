package icia.project.gabom.dto;

import org.apache.ibatis.type.Alias;
import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;
import lombok.experimental.Accessors;

@Alias("adminnotices")
@Data
@Accessors(chain=true)
public class Adminnotices {
	private int all_notices_number;
	private String all_notices_title;
	private String all_notices_body;
	private int all_notices_views;
	
	@DateTimeFormat(pattern="yyyy-mm-dd")
	private int all_notices_date;
	
}
