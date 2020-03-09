package icia.project.gabom.dto;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.experimental.Accessors;

@Alias("jungmoattend")
@Data
@Accessors(chain=true)
public class JungmoAttend {


		private String member_name;
		private String member_profile_picture;
		private String member_profile_contents;
		private int member_grade;
		private int somoim_number;
	

}
