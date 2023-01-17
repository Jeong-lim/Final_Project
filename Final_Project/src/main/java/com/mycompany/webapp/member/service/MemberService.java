package com.mycompany.webapp.member.service;

import java.beans.Encoder;
import java.lang.reflect.Member;
import java.util.List;

import org.apache.taglibs.standard.lang.jstl.test.beans.PublicBean1;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.mycompany.webapp.member.dao.MemberDao;
import com.mycompany.webapp.member.model.AlarmVo;
import com.mycompany.webapp.member.model.MemberVo;
import com.sun.org.apache.bcel.internal.generic.LSTORE;

@Service
public class MemberService  {
	private static final Logger logger = LoggerFactory.getLogger(MemberService.class);

	@Autowired
	private MemberDao memberDao;
	
	public int userTravelCount(String memberId) {
		return memberDao.userTravelCount(memberId);
	}
	
	public void insertMember(MemberVo member) {
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		String securePw = encoder.encode(member.getMemberPassword());
		member.setMemberPassword(securePw);		
		
		memberDao.insertMember(member);
	}
	
	public MemberVo selectMember(String memberId) {
		return memberDao.selectMember(memberId);
	}
	
	public MemberVo selectMemberInfo(String memberId) {
		return memberDao.selectMemberInfo(memberId);
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
	
	public List<MemberVo> userTravelList(String memberId) throws Exception{
		return memberDao.userTravelList(memberId);
	}
	
	public int countFollower(String memberId) {
		return memberDao.countFollower(memberId);
	}
	
	public int countFollowing(String memberId) {
		return memberDao.countFollowing(memberId);
	}
	
	public void requestFollow(String memberId, String sessionId) {
		memberDao.requestFollow(memberId, sessionId);
	}
	
	public String checkFollowStatus(String memberId, String sessionId) {
		return memberDao.checkFollowStatus(memberId, sessionId);
	}
	
	public void insertAlarm(String memberId, String sessionId,String alarmCode) {
		memberDao.insertAlarm(memberId, sessionId, alarmCode);
	}
	
	public List<AlarmVo> selectAlarms(String sessionId){
		return memberDao.selectAlarms(sessionId);
	}
	
	public List<MemberVo> selectFollowerList(String sessionId){
		return memberDao.selectFollowerList(sessionId);
	}
	
	
	



}
