package icia.project.gabom.dto;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.experimental.Accessors;

@Alias("hfile")
@Data
@Accessors(chain=true)
public class Housefile {
	private int house_number;
	private int house_imagetype;
	private String house_oriname;
	private String house_sysname;

}
