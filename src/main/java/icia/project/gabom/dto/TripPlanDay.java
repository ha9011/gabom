package icia.project.gabom.dto;

import java.util.List;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.experimental.Accessors;

@Alias("tripplanday")
@Data
@Accessors(chain = true)
public class TripPlanDay {
		private String day;
		private String tripNum;
		private	List<TripPlanDetail> tripData;
}
