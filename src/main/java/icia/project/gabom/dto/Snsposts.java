package icia.project.gabom.dto;

import java.util.Date;

import org.apache.ibatis.type.Alias;
import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

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
	

	@JsonFormat(pattern="yyyy-MM-dd")
	private Date sns_posts_date;
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date sns_posts_edit_date;
	
	private String friend_id;
	private String friend_my_id;
	private int friend_status;
	
	private	String sns_photo_origin_name;
	private	String sns_photo_system_name;
	
	private int like;
	private int hate;
	private int postsNumber;
	private String memberId;
	
	
}
