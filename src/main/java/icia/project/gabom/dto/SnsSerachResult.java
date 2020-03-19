package icia.project.gabom.dto;



import lombok.Data;
import lombok.experimental.Accessors;

@Data
@Accessors(chain = true)
public class SnsSerachResult {
	private int postNumber;
	private String writer;
	private String date;
	private int security;
	private int report;
	private String contents;
	private String id;
}
