package icia.project.gabom.dto;

import java.sql.Date;

import org.apache.ibatis.type.Alias;
import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;
import lombok.experimental.Accessors;

@Alias("photoalbum")
@Accessors(chain=true)
@Data
public class Somoim_photoalbum {
	private int somoim_number;
	private int photo_number;
	private String photo_orifile;
	private String photo_sysfile;
	
	@DateTimeFormat(pattern="yyyy-mm-dd")
	private String photo_upload_date;
	
	@DateTimeFormat(pattern="yyyy-mm-dd")
	private String photo_update_date;
	
	
	
}
