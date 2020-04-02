package icia.project.gabom.dto;

import java.time.LocalDateTime;

import org.apache.ibatis.type.Alias;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;
import lombok.experimental.Accessors;


@Alias("snsDmDto")
@Data
@Accessors(chain = true)
public class SnsDmDto {
	String sendMember;
	String getMember;
	String contents;
	@JsonFormat(pattern = "yyyy-MM-dd HH:MM", timezone = "Asia/Seoul")
	LocalDateTime dmDate;
	String memberPic;
}
