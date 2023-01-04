package com.mycompany.webapp.member.dao;
import org.apache.ibatis.annotations.Mapper;

import com.mycompany.webapp.member.model.MemberVo;

import java.util.List;

@Mapper
public interface MemberDao {
	public List<MemberVo> selectAllMembers();
	public MemberVo selectMember(String memberId);
	public void insertMember(MemberVo member);
	public void updateMember(MemberVo member);
	public void deleteMember(MemberVo member);
	public String getPassword(String memberId);
}
