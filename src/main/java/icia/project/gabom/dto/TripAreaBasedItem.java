package icia.project.gabom.dto;

import java.util.List;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.experimental.Accessors;

@Alias("tripareabaseditem")
@Data
@Accessors(chain=true)
public class TripAreaBasedItem {
	private List<TripAreaBasedList> item;
}
