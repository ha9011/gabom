package icia.project.gabom.dto;

import java.util.Date;

import org.apache.ibatis.type.Alias;
import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;
import lombok.experimental.Accessors;


@Alias("snsCommentDto")
@Data
@Accessors(chain = true)
public class SnsCommentDto {
		private int commentNumber;
		private String content;
		private String id;
		@JsonFormat(pattern="yyyy-MM-dd")
		private	Date commentDate;
		@JsonFormat(pattern="yyyy-MM-dd")
		private Date editDate;
		private	int postNumber;
		private	int report;
}
