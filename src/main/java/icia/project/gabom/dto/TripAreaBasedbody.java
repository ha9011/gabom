package icia.project.gabom.dto;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.experimental.Accessors;

@Alias("tripareabasedbody")
@Data
@Accessors(chain=true)
public class TripAreaBasedbody {
	private TripAreaBasedItems body;
	private TripAteaBasedheader header;
}
