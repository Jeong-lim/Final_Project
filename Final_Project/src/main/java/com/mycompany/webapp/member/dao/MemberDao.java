package com.mycompany.webapp.member.dao;
import org.apache.ibatis.annotations.Mapper;

import com.mycompany.webapp.member.model.MemberVo;
import com.sun.tools.javac.util.List;


@Mapper
public interface MemberDao {
	public MemberVo selectMember(String memberId);
	public void insertMember(MemberVo member);
	public void updateMember(MemberVo member);
	public void deleteMember(MemberVo member);
	public String getPassword(String memberId);
	public String getAccessToken(String authorize_code) throws Throwable;
	public int checkOverId(String memberId);
	public List<MemberVo> userTravelList(String memberId);
}
