package icia.project.gabom.dto;

import org.apache.ibatis.type.Alias;
import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;
import lombok.experimental.Accessors;

@Alias("hreservation")
@Data
@Accessors(chain=true)
public class Housereservation {
	private int reservation_number;
	private String house_hostid;
	private int house_number;
	private String member_guestid;
	private String house_name;
	private int house_review_status;
	
	@DateTimeFormat(pattern="yyyy-mm-dd")
	private String reservation_checkin;
	
	@DateTimeFormat(pattern="yyyy-mm-dd")
	private String reservation_checkout;
	
	private int reservation_person;
	private int reservation_totalprice;
	

}
