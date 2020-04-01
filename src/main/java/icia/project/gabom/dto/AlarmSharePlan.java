package icia.project.gabom.dto;

import java.util.List;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.experimental.Accessors;

@Alias("alarmshareplan")
@Data
@Accessors(chain=true)
public class AlarmSharePlan {
	private String type;
	private int trip_number;
	private String share_id;
	private String my_id;
	
}
