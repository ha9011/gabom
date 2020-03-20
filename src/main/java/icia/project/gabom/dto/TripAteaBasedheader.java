package icia.project.gabom.dto;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.experimental.Accessors;

@Alias("tripateabasedheader")
@Data
@Accessors(chain=true)
public class TripAteaBasedheader {
	private String resultCode;
	private String resultMsg;
}
