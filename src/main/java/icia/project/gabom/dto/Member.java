package icia.project.gabom.dto;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;


//@Getter@Setter
//@NoArgsConstructor
//@AllArgsConstructor

@Alias("member")
@Data
@Accessors(chain=true)
public class Member {
	private String member_id;
	private String member_password;
	private String member_name;
	private String member_phone;
	private String member_email;
	private String member_birth;
	private String member_address;
	private String member_hobby;
	private int member_type;
	private int member_login_check;
	private String member_profile_picture;
	private String member_profile_original;
	private String member_profile_contents;
	private int enabled;
	private int member_money;
	
	private String g_name; 
	
	private int somoim_status;
	private int somoim_grade;
}
