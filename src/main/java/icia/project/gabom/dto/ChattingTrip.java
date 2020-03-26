package icia.project.gabom.dto;

import org.apache.ibatis.type.Alias;
import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;
import lombok.experimental.Accessors;

@Alias("chattingtrip")
@Data
@Accessors(chain = true)
public class ChattingTrip {

	private String chatting_profile;
	private String trip_number;
	private String chatting_name; //아이디
	private String chatting_content;

	@DateTimeFormat(pattern = "yyyy-mm-dd")
	private String chatting_date;
}