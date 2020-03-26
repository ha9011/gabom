package icia.project.gabom.dto;

import java.util.List;

import org.apache.ibatis.type.Alias;
import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;
import lombok.experimental.Accessors;

@Alias("chattinginfinite")
@Data
@Accessors(chain=true)
public class ChattingInfinite {
	@DateTimeFormat(pattern = "yyyy-mm-dd")
	private String date ;
	private List<ChattingSomoim> chattingData;
	private List<ChattingTrip> chattingtripDate; 
	
}
