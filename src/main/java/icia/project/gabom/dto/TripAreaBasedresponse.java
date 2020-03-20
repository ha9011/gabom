package icia.project.gabom.dto;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.experimental.Accessors;

@Alias("tripareabasedresponse")
@Data
@Accessors(chain=true)
public class TripAreaBasedresponse {
	private TripAreaBasedbody response;
}
