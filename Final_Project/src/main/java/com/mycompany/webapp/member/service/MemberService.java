package com.mycompany.webapp.member.service;

import java.beans.Encoder;
import java.lang.reflect.Member;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.mycompany.webapp.member.dao.MemberDao;
import com.mycompany.webapp.member.model.MemberVo;
import com.sun.org.apache.bcel.internal.generic.LSTORE;
import com.sun.tools.javac.util.List;

@Service
public class MemberService  {
	private static final Logger logger = LoggerFactory.getLogger(MemberService.class);

	@Autowired
	private MemberDao memberDao;
	
	public void insertMember(MemberVo member) {
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		String securePw = encoder.encode(member.getMemberPassword());
		member.setMemberPassword(securePw);		
		
		memberDao.insertMember(member);
	}
	
	public MemberVo selectMember(String memberId) {
		return memberDao.selectMember(memberId);
	}
	
	public void updateMember(MemberVo member) {
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		String securePw = encoder.encode(member.getMemberPassword());
		member.setMemberPassword(securePw);		
		memberDao.updateMember(member);
	}
	
	public void deleteMember(MemberVo member) {
		memberDao.deleteMember(member);
	}
	
	public String getPassword(String memberId) {
		return memberDao.getPassword(memberId);
	}

	public int memberIdCheck(String memberId) {
		return memberDao.checkOverId(memberId);
	}
	
	public List<MemberVo> userTravelList(String memberId) {
		List<MemberVo> userTravelList = memberDao.userTravelList(memberId);
		return userTravelList;
	}
	



}
