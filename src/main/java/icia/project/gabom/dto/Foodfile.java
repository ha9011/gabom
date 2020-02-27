package icia.project.gabom.dto;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.experimental.Accessors;

@Alias("ffile")
@Data
@Accessors(chain=true)
public class Foodfile {
	private int food_number;
	private int food_imagetype;
	private String food_oriname;
	private String food_sysname;

}

