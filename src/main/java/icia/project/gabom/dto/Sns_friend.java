package icia.project.gabom.dto;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.experimental.Accessors;

@Alias("friend")
@Data
@Accessors(chain=true)
public class Sns_friend {
	private String friend_my_id;
	private String friend_id;
	private int friend_status;
	
	//여행에서 친구 이름 , 사진 가져옴 
	private String member_name;
	private String member_profile_picture;
}
