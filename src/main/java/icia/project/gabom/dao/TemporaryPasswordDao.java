package icia.project.gabom.dao;

import org.apache.ibatis.annotations.Param;

import icia.project.gabom.dto.Member;

public interface TemporaryPasswordDao {

	boolean temporaryPasswordDao(@Param("member") Member member, @Param("password") String member_password);

}
