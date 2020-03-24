package icia.project.gabom.dto;




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
	private int like;
	private int hate;
	private int max;
}
