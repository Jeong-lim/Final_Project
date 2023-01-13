package com.mycompany.webapp.member.dao;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.webapp.member.model.MemberVo;


@Mapper
public interface MemberDao {
	public MemberVo selectMember(String memberId);
	public void insertMember(MemberVo member);
	public void updateMember(MemberVo member);
	public void deleteMember(MemberVo member);
	public String getPassword(String memberId);
	public String getAccessToken(String authorize_code) throws Throwable;
	public int checkOverId(String memberId);
	public List<MemberVo> userTravelList(String memberId) throws Exception;
}
