package com.mycompany.webapp.member.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.mycompany.webapp.member.model.MemberVo;

@Mapper
public interface KakaoDao {
	public MemberVo selectKakaoInfo(String email);
	public void insertKakao(MemberVo member);
	public String getAccessToken(String authorize_code) throws Throwable;
}
