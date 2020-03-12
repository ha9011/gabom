package icia.project.gabom.dto;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.experimental.Accessors;

@Alias("splike")
@Data
@Accessors(chain=true)
public class Somoim_photo_like {
	private int like_number;
	private String like_id;
	private int photo_number;
	private int somoim_number;
	private int like_status;
	

}
