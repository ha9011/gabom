package icia.project.gabom.dto;

import org.apache.ibatis.type.Alias;
import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;
import lombok.experimental.Accessors;

//@Getter@Setter
//@NoArgsConstructor
//@AllArgsConstructor

@Alias("house")
@Data
@Accessors(chain=true)
public class House {
	
	private String house_name;
	private String house_mainImage;
	private String house_address;
	private String house_type;
	
	private String house_detailImages;  // 사진 여러개라서, array로 해야 할 수도 있음
	
	private String house_price;
	private String house_parkable;
	private String house_rooms;
	private String house_bathrooms;
	private String house_beds;
	
	@DateTimeFormat(pattern="yyyy-mm-dd")
	private String mindate;
	
	@DateTimeFormat(pattern="yyyy-mm-dd")
	private String maxdate;
	
	
}
