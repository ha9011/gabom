package icia.project.gabom.dto;

import org.apache.ibatis.type.Alias;
import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;
import lombok.experimental.Accessors;

@Alias("somoimreple")
@Accessors(chain=true)
@Data
public class Somoimreple {
	//프로필의 사진
	private String member_profile_picture;
	
	private int somoim_board_reple_number;
	private int board_number;
	private int paging_number;
	private int somoim_number;
	
	private String somoim_board_reple_name;
	private String somoim_board_reple_content;

	@DateTimeFormat(pattern="yyyy-mm-dd")
	private String somoim_board_reple_date;
	@DateTimeFormat(pattern="yyyy-mm-dd")
	private String somoim_board_reple_update;
	
	
	
}