package icia.project.gabom.dto;

import lombok.Data;
import lombok.experimental.Accessors;

@Data
@Accessors(chain = true)
public class SnsLikeHateCounter {
		private int snsLike;
		private int snsHate;
		private String memberId;
}
