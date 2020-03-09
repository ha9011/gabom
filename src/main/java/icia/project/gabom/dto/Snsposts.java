package icia.project.gabom.dto;

import org.apache.ibatis.type.Alias;
import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;
import lombok.experimental.Accessors;

@Alias("snspost")
@Data
@Accessors(chain=true)
public class Snsposts {
	private int sns_posts_number;
	private String sns_posts_content;
	private String sns_posts_writer;
	private String sns_posts_hashtag;
	private int sns_posts_authority;
	private int sns_posts_report;
	

	@DateTimeFormat(pattern="yyyy-mm-dd")
	private String sns_posts_date;
	
	@DateTimeFormat(pattern="yyyy-mm-dd")
	private String sns_posts_edit_date;
	
	private String friend_id;
	private String friend_my_id;
	private int friend_status;
	
}
