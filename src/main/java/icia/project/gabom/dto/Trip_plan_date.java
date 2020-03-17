package icia.project.gabom.dto;

import org.apache.ibatis.type.Alias;
import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;
import lombok.experimental.Accessors;

@Alias("tripdate")
@Data
@Accessors(chain=true)
public class Trip_plan_date {
	private int trip_number;
	
	@DateTimeFormat(pattern="yyyy-mm-dd")
	private String trip_date;

}
