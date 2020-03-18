package icia.project.gabom.dto;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.experimental.Accessors;

@Alias("apisearch")
@Data
@Accessors(chain=true)
public class Apisearch {
	
	private String areaCode;
	
	
}
