package com.mycompany.webapp.member.service;

import java.beans.Encoder;
import java.lang.reflect.Member;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
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
	
	public List<MemberVo> userMainTravelList(String memberId) throws Exception{
		return memberDao.userMainTravelList(memberId);
	}
	
	
	public int countFollower(String memberId) {
		return memberDao.countFollower(memberId);
	}
	
	public int countFollowing(String memberId) {
		return memberDao.countFollowing(memberId);
	}
	
	public void requestFollow(String memberId, String sessionId) {
		Map<String, String> map = new HashMap<>();
		map.put("memberId", memberId);
		map.put("sessionId", sessionId);
		memberDao.requestFollow(map);
	}
	
	public String checkFollowStatus(String memberId, String sessionId) {
		Map<String, String> map = new HashMap<>();
		map.put("memberId", memberId);
		map.put("sessionId", sessionId);
		return memberDao.checkFollowStatus(map);
	}
	
	public void insertAlarm(String memberId, String sessionId,String alarmCode) {
		Map<String, String> map = new HashMap<>();
		map.put("memberId", memberId);
		map.put("sessionId", sessionId);
		map.put("alarmCode", alarmCode);
		memberDao.insertAlarm(map);
	}
	
	public List<AlarmVo> selectAlarms(String sessionId){
		return memberDao.selectAlarms(sessionId);
	}
	
	public List<MemberVo> selectFollowerList(String memberId){
		return memberDao.selectFollowerList(memberId);
	}
	
	public List<MemberVo> selectFollowList(String memberId){
		return memberDao.selectFollowList(memberId);
	}
	
	public List<MemberVo> searchUser (String keyword){
		return memberDao.searchUser(keyword);
	}
	
	public String searchFollowerSeq(String memberId, String sessionId) {
		Map<String, String> map = new HashMap<>();
		map.put("memberId", memberId);
		map.put("sessionId", sessionId);
		return memberDao.searchFollowerSeq(map);
	}
	
	public String searchFollowSeq(String memberId, String sessionId) {
		Map<String,String> map =new HashMap<>();
		map.put("memberId", memberId);
		map.put("sessionId", sessionId);
		return memberDao.searchFollowSeq(map);
	}
	
	public void acceptFollow(String followSeq) {
		memberDao.acceptFollow(followSeq);
	}
	
	public void rejectFollow(String followSeq) {
		memberDao.rejectFollow(followSeq);
	}
	
	public void changeStatusN(String alarmSeq) {
		memberDao.changeStatusN(alarmSeq);
	}
	
	public void unFollow(String followSeq) {
		memberDao.unFollow(followSeq);
	}
	
	public void changeFollowStatusN(String followSeq) {
		memberDao.changeFollowStatusN(followSeq);
	}
	
	public String findUserId(String email, String userName) {
		return memberDao.findUserId(email, userName);
	}
	
	public void cancelFollowAlarm(String memberId,String sessionId) {
		Map<String,String>map =new HashMap<>();
		map.put("memberId", memberId);
		map.put("sessionId", sessionId);
		memberDao.cancelFollowAlarm(map);
	}
	
	public void insertCheckList(@Param("memberId") String memberId, @Param("Item") String Item) {
		memberDao.insertCheckList(memberId, Item);
	}
	
	public List<Map<String, String>> selectCheckList(String memberId) {
		return memberDao.selectCheckList(memberId);
	}
	
	public void resetCheckList(@Param("memberId") String memberId) {
		memberDao.resetCheckList(memberId);
	}
	
	public void updateCheckList(@Param("memberId") String memberId, @Param("status") String status,
			@Param("item") String item) {
		memberDao.updateCheckList(memberId, status, item);
	}

	public void deleteCheckList(@Param("memberId") String memberId, @Param("checkId") String checkId) {
		memberDao.deleteCheckList(memberId, checkId);
		
	}
	 


}
