package icia.project.gabom.dto;


import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.experimental.Accessors;

@Alias("tripareabaseditems")
@Data
@Accessors(chain=true)
public class TripAreaBasedItems {
	private TripAreaBasedItem items;
	private int numOfRows; 
	private int pageNo; 
	private int totalCount;
	private int line;
	private int column;
	
}
