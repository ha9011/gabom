package icia.project.gabom.dao;

import org.apache.ibatis.annotations.Param;

public interface SnsPostDeleteDao {

	boolean commentServiceDel(@Param("postNumber")int postNumber);

	boolean commentDel(@Param("postNumber")int postNumber);

	boolean postServiceDel(@Param("postNumber")int postNumber);

	boolean postPhotoDel(@Param("postNumber")int postNumber);

	boolean postDel(@Param("postNumber")int postNumber);

}
