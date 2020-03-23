package icia.project.gabom.dto;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.experimental.Accessors;

@Alias("frimage")
@Data
@Accessors(chain=true)
public class Food_review_image {
	
	private int food_review_number;
	//후기 사진 
	private String food_review_orifile;
	private String food_review_sysfile;

}
