package icia.project.gabom.dto;

import org.apache.ibatis.type.Alias;
import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;
import lombok.experimental.Accessors;

@Alias("freview")
@Data
@Accessors(chain=true)
public class Food_review {
		
		private int food_review_number;
		private int food_number;
		private String member_guestid;
		private String food_review_content;
		private int foodreservation_number;
		
		@DateTimeFormat(pattern="yyyy-mm-dd")
		private String food_review_date;
		
		//후기 사진 
		private String food_review_orifile;
		private String food_review_sysfile;
		
		//작성자 사진
		private String member_profile_picture;

}
