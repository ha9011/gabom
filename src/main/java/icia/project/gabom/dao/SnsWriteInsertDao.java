package icia.project.gabom.dao;



import icia.project.gabom.dto.Snsposts;

public interface SnsWriteInsertDao {

	//int snsPhotoInsert(List<Snsposts> fileNameList);
	//@Param("snsposts") 
	int snsWriteInsert(Snsposts snsPostsWrite);

	int snsPhotoInsert(Snsposts snsPhotoPosts);

}
