package icia.project.gabom.dto;

import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;
import lombok.experimental.Accessors;

@Data
@Accessors(chain=true)
public class SnsTimeLineResult {
	private int posts_number;
	private String posts_writer;
	private String content;
	private String posts_hashtag;
	private int posts_authority;
	private int posts_report;
	@DateTimeFormat(pattern="yyyy-mm-dd")
	private String sns_posts_date;
	@DateTimeFormat(pattern="yyyy-mm-dd")
	private String sns_posts_edit_date;
	private List<SnsPhoto> photoList;
	private int like;
	private int hate;
	private String profilePicture;
}
