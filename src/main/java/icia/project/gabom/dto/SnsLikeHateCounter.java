package icia.project.gabom.dto;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.experimental.Accessors;

@Alias("snsLikeHate")
@Data
@Accessors(chain = true)
public class SnsLikeHateCounter {
		private int snsLike;
		private int snsHate;
		private String memberId;
		private int postNumber;
		private int commentNumber;
}
