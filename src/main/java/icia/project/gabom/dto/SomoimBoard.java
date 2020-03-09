package icia.project.gabom.dto;

import org.apache.ibatis.type.Alias;
import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;
import lombok.experimental.Accessors;

@Alias("somoimboard")
@Data
@Accessors(chain=true)
public class SomoimBoard {
	private int board_number;
	private int somoim_number;
	private String board_writer;
	private String board_type;
	private String board_title;
	private String board_content;
	
	private String board_first_pic="없음";
	private String board_first_syspic="없음";
	
	private String board_second_pic="없음";
	private String board_second_syspic="없음";
	
	private String board_third_pic="없음";
	private String board_third_syspic="없음";
	
	
	private String board_fix="비고정";
	
	@DateTimeFormat(pattern="yyyy-mm-dd")
	private String board_write_date;
	@DateTimeFormat(pattern="yyyy-mm-dd")
	private String board_write_update;
	
}
