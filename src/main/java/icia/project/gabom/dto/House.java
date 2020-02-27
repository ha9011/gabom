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
	private String house_hostid;
	private int house_number;
	private String house_name;
	private String house_address;
	private String house_xpoint; // 위도 경도 추가 
	private String house_ypoint;
	private int house_type;
	
	//private MultipartFile house_mainImage;
	//private List<MultipartFile> house_detailImages;  // 사진 여러개라서, array로 해야 할 수도 있음
	
	private int house_granttype;
	private int house_person;
	private int house_price;
	private int house_parkable;
	private int house_rooms;
	private int house_bathrooms;
	private int house_beds;
	
	
	@DateTimeFormat(pattern="yyyy-mm-dd")
	private String house_mindate;
	
	@DateTimeFormat(pattern="yyyy-mm-dd")
	private String house_maxdate;
	
}
