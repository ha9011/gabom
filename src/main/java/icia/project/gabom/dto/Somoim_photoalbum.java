package icia.project.gabom.dto;

import java.sql.Date;
import java.util.List;

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
	
	
	private int splike = 0;  // 좋아요 갯수
	
	@DateTimeFormat(pattern="yyyy-mm-dd")
	private String photo_upload_date;
	
	@DateTimeFormat(pattern="yyyy-mm-dd")
	private String photo_update_date;
	
	private List<Somoim_photo_reple> spreple;
	
}
