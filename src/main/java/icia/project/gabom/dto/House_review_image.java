package icia.project.gabom.dto;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.experimental.Accessors;

@Alias("hreviewimg")
@Data
@Accessors(chain=true)
public class House_review_image {
		private int house_review_number;
		
		//후기 사진 
		private String house_review_orifile;
		private String house_review_sysfile;
}
