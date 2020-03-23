package icia.project.gabom.dto;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.experimental.Accessors;

@Alias("tripareabasedlist")
@Data
@Accessors(chain=true)
public class TripAreaBasedList {
	private String addr1;
	private String addr2;
	private int areacode;
	private String cat1;
	private String cat2;
	private String cat3;
	private int contentid;
	private int contenttypeid;
	private long createdtime;
	private String firstimage = "없음";
	private String firstimage2;
	private String tel;
	private Object mapx;
	private Object mapy;
	private int mlevel;
	private long modifiedtime;
	private int readcount;
	private int sigungucode;
	private String title;
	private Object zipcode;
	
}
