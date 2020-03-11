package icia.project.gabom.dto;

import lombok.Data;
import lombok.experimental.Accessors;

@Data
@Accessors(chain = true)
public class SnsPhoto {
	private	String sns_photo_origin_name;
	private	String sns_photo_system_name;
	private int sns_posts_number;
}
