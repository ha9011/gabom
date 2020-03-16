package icia.project.gabom.dto;

import java.util.List;

import org.apache.ibatis.type.Alias;
import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;
import lombok.experimental.Accessors;

@Alias("somoimboard")
@Data
@Accessors(chain=true)
public class SomoimBoard {
	private String member_profile_picture;
	
	private int board_number;
	private int somoim_number;
	private int board_like;
	
	private int total_like = 0; // 좋아요 갯수

	private int total_reple = 0; // 댓글 갯수
	
	private String board_like_name;  // 댓글, 좋아요의 행위자... like 이해점...
	
	private String somoim_board_reple_content; //댓글 내용
	
	private String board_writer;  // 해당 게시글 글쓴으
	private String board_type;
	private String board_title;
	private String board_content;   
	
	private String board_first_pic="";
	private String board_first_syspic="";
	
	private String board_second_pic="";
	private String board_second_syspic="";
	
	private String board_third_pic="";
	private String board_third_syspic="";
	
	
	private String board_fix="비고정";
	
	@DateTimeFormat(pattern="yyyy-mm-dd")
	private String board_write_date;
	@DateTimeFormat(pattern="yyyy-mm-dd")
	private String board_write_update;
	
	//댓글들 모음
	private List<Somoimreple> somoimreple;
	
	
	// 페이징 String
	private int paging_number;
	private String htmlPaging;
	
}
