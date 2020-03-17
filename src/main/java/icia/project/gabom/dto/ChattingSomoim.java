package icia.project.gabom.dto;

import org.apache.ibatis.type.Alias;
import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;
import lombok.experimental.Accessors;

@Alias("chattingsomoim")
@Data
@Accessors(chain = true)
public class ChattingSomoim {

	private String chatting_profile;
	private String somoim_number;
	private String chatting_name; //아이디
	private String chatting_content;

	@DateTimeFormat(pattern = "yyyy-mm-dd")
	private String chatting_date;
}