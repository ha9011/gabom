package icia.project.gabom.dto;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;
import lombok.experimental.Accessors;

@Alias("tripplandetail")
@Data
@Accessors(chain = true)
public class TripPlanDetail {
	
	private String trip_date;
	private String trip_number;
	private String trip_ypoint;
	private String trip_xpoint;
	private String trip_title;
	private String trip_destination;
	private String trip_img;
	private int trip_order;
	private int trip_type;
	
	
	
}
