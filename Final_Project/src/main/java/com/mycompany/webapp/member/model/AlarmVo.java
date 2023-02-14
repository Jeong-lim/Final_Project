package com.mycompany.webapp.member.model;

public class AlarmVo {
	
	private String alarmSeq;
	private String alarmToId;
	private String alarmFromId;
	private String alarmCode;
	private String alarmStatus;
	private String followStatus;
	private String followSeq;
	
	public String getAlarmSeq() {
		return alarmSeq;
	}
	public void setAlarmSeq(String alarmSeq) {
		this.alarmSeq = alarmSeq;
	}
	public String getAlarmToId() {
		return alarmToId;
	}
	public void setAlarmToId(String alarmToId) {
		this.alarmToId = alarmToId;
	}
	public String getAlarmFromId() {
		return alarmFromId;
	}
	public void setAlarmFromId(String alarmFromId) {
		this.alarmFromId = alarmFromId;
	}
	public String getAlarmCode() {
		return alarmCode;
	}
	public void setAlarmCode(String alarmCode) {
		this.alarmCode = alarmCode;
	}
	public String getAlarmStatus() {
		return alarmStatus;
	}
	public void setAlarmStatus(String alarmStatus) {
		this.alarmStatus = alarmStatus;
	}
	public String getFollowStatus() {
		return followStatus;
	}
	public void setFollowStatus(String followStatus) {
		this.followStatus = followStatus;
	}
	public String getFollowSeq() {
		return followSeq;
	}
	public void setFollowSeq(String followSeq) {
		this.followSeq = followSeq;
	}
	@Override
	public String toString() {
		return "AlarmVo [alarmSeq=" + alarmSeq + ", alarmToId=" + alarmToId + ", alarmFromId=" + alarmFromId
				+ ", alarmCode=" + alarmCode + ", alarmStatus=" + alarmStatus + ", followStatus=" + followStatus
				+ ", followSeq=" + followSeq + "]";
	}
	
	
	
	

}
