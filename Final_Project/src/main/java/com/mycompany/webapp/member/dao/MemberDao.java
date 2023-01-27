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
	public int checkOverId(String memberId);
	public List<MemberVo> userTravelList(String memberId) throws Exception;
	public int userTravelCount(String memberId);
	public int countFollower(String memberId); // 팔로워 수
	public int countFollowing(String memberId); //팔로우 수
	public void requestFollow(Map<String, String> map); //팔로우 신청
	public String checkFollowStatus(Map<String, String> map); //팔로우 상태체크
	public String searchFollowerSeq(Map<String,String>map);//팔로워 시퀀스 찾기
	public String searchFollowSeq(Map<String,String>map);//팔로우 시퀀스 찾기
	public void insertAlarm(Map<String, String> map); //알림 추가
	public List<AlarmVo> selectAlarms(String sessionId); //알림 리스트
	public List<MemberVo> selectFollowerList(String memberId); //팔로워 리스트
	public List<MemberVo> selectFollowList(String memberId); //팔로우 리스트
	public List<MemberVo> searchUser(String keyword); //유저검색결과리스트
	public void acceptFollow(String followSeq);//팔로우 허용
	public void rejectFollow(String followSeq);//팔로우 거절
	public void changeStatusN(String alarmSeq);//알림 상태 변경
	public void unFollow(String followSeq);//언팔로우하기
	public void changeFollowStatusN(String followSeq);
	
}
