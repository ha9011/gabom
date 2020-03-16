package icia.project.gabom.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;
import lombok.experimental.Accessors;

@Data
@Accessors(chain = true)
public class SnsCommentResult {
	private int number;
	private String content;
	private String id;
	private	String date;
	private String editDate;
	private	int postNumber;
	private	int report;
	private String profilePic;
}
