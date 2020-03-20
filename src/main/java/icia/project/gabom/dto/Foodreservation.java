package icia.project.gabom.dto;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.experimental.Accessors;

@Alias("freservation")
@Data
@Accessors(chain=true)
public class Foodreservation {
	private int foodreservation_number;
	private int food_number;
	private String food_hostid;
	private String member_guestid;
	private String foodreservation_date;
	private int foodreservation_person;
	private String foodreservation_time;
	
	private String food_name;

}
