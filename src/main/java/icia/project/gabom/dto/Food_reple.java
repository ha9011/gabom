package icia.project.gabom.dto;

import org.apache.ibatis.type.Alias;
import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;
import lombok.experimental.Accessors;

@Alias("f_reple")
@Data
@Accessors(chain = true)
public class Food_reple {

	private int food_reple_number;
	private int food_number;
	private String member_guestid;
	private String food_reple_content;

	@DateTimeFormat(pattern = "yyyy-mm-dd")
	private String food_reple_time;
}
