package icia.project.gabom.dto;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.experimental.Accessors;

@Alias("tripmemoupdate")
@Data
@Accessors(chain=true)
public class Tripmemoupdate {
	private String trip_number;
	private String trip_date;
	private String trip_order;
	private String trip_title;
	private String trip_memo;
}
