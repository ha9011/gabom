package icia.project.gabom.dto;

import java.util.List;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.experimental.Accessors;

@Alias("alarmjungmo")
@Data
@Accessors(chain=true)
public class AlarmJungmo {
	private String type;
	private String somoimNumber;
	private List<String> members;
	
}
