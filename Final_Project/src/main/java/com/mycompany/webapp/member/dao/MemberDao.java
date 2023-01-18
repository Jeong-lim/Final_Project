package com.mycompany.webapp.member.dao;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.mycompany.webapp.member.model.AlarmVo;
import com.mycompany.webapp.member.model.MemberVo;


@Mapper
public interface MemberDao {
	public MemberVo selectMember(String memberId);
	public MemberVo selectMemberInfo(String memberId);
	public void insertMember(MemberVo member);
	public void updateMember(MemberVo member);
	public void deleteMember(MemberVo member);
	public String getPassword(String memberId);
	public String getAccessToken(String authorize_code) throws Throwable;
	public int checkOverId(String memberId);
	public List<MemberVo> userTravelList(String memberId) throws Exception;
	public int userTravelCount(String memberId);
	public int countFollower(String memberId); // 팔로워 수
	public int countFollowing(String memberId); //팔로우 수
	public void requestFollow(String memberId, String sessionId); //팔로우 신청
	public String checkFollowStatus(Map<String, String> map); //팔로우 상태체크
	public void insertAlarm(String memberId, String sessionId, String alarmCode); //알림 추가
	public List<AlarmVo> selectAlarms(String sessionId); //알림 리스트
	public List<MemberVo> selectFollowerList(String memberId);
	public List<MemberVo> selectFollowList(String memberId);
}
