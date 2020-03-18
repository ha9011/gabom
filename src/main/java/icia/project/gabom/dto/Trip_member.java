package icia.project.gabom.dto;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.experimental.Accessors;

@Alias("trfriend")
@Data
@Accessors(chain=true)
public class Trip_member {
	private String share_id;
	private int trip_number;
	private int trip_type;
	private String trip_title;
	private String trip_id;
	
	private Trip_plan trip;
}
