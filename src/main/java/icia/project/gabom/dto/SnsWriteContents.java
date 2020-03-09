package icia.project.gabom.dto;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.experimental.Accessors;

@Alias("snsWriteContents")
@Data
@Accessors(chain=true)
public class SnsWriteContents {
	private int SNS_POSTS_NUMBER;
	private	String SNS_POSTS_CONTENT;
	private	String SNS_POSTS_WRITER;
	private	Date SNS_POSTS_DATE;
	private	Date SNS_POSTS_EDIT_DATE;
	private	String SNS_POSTS_HASHTAG;
	private	int SNS_POSTS_AUTHORITY;
	private	int SNS_POSTS_REPORT;
	private	String SNS_PHOTO_ORIGIN_NAME;
	private	String SNS_PHOTO_SYSTEM_NAME;
}
