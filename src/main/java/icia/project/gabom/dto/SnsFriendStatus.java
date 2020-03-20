package icia.project.gabom.dto;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.experimental.Accessors;



@Alias("friendS")
@Data
@Accessors(chain = true)
public class SnsFriendStatus {
	private String myId;
	private String friendId;
	private int status;
}
