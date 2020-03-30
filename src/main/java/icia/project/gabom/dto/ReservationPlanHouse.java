package icia.project.gabom.dto;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.experimental.Accessors;

@Alias("reservationplanhouse")
@Data
@Accessors(chain=true)
public class ReservationPlanHouse {
		//후기 사진 
		private String house_name;
		private String house_address;
		private String house_xpoint;
		private String house_ypoint;
		private String house_sysname;
		private String reservation_checkin;
		private String reservation_checkout;
}
