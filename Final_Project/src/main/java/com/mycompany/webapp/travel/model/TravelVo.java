package com.mycompany.webapp.travel.model;

public class TravelVo {

	private String userId;
	private String travelTitle;
	private String travelStart;
	private String travelEnd;
	private char travelPrivacy;
	private char free;
	private int viewCnt;
	private int shareCnt;
	private String travelDate;
	private String placeId;
	private String memo;
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getTravelTitle() {
		return travelTitle;
	}
	public void setTravelTitle(String travelTitle) {
		this.travelTitle = travelTitle;
	}
	public String getTravelStart() {
		return travelStart;
	}
	public void setTravelStart(String travelStart) {
		this.travelStart = travelStart;
	}
	public String getTravelEnd() {
		return travelEnd;
	}
	public void setTravelEnd(String travelEnd) {
		this.travelEnd = travelEnd;
	}
	public char getTravelPrivacy() {
		return travelPrivacy;
	}
	public void setTravelPrivacy(char travelPrivacy) {
		this.travelPrivacy = travelPrivacy;
	}
	public char getFree() {
		return free;
	}
	public void setFree(char free) {
		this.free = free;
	}
	public int getViewCnt() {
		return viewCnt;
	}
	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}
	public int getShareCnt() {
		return shareCnt;
	}
	public void setShareCnt(int shareCnt) {
		this.shareCnt = shareCnt;
	}
	public String getTravelDate() {
		return travelDate;
	}
	public void setTravelDate(String travelDate) {
		this.travelDate = travelDate;
	}
	public String getPlaceId() {
		return placeId;
	}
	public void setPlaceId(String placeId) {
		this.placeId = placeId;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	@Override
	public String toString() {
		return "TravelVo [userId=" + userId + ", travelTitle=" + travelTitle + ", travelStart=" + travelStart
				+ ", travelEnd=" + travelEnd + ", travelPrivacy=" + travelPrivacy + ", free=" + free + ", viewCnt="
				+ viewCnt + ", shareCnt=" + shareCnt + ", travelDate=" + travelDate + ", placeId=" + placeId + ", memo="
				+ memo + "]";
	}
	
	

}
