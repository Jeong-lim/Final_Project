package com.mycompany.webapp.travel.model;

import java.util.Arrays;
import java.util.Date;

public class TravelVo {

	private String travelId;
	private String travelTitle;
	private String travelStart;
	private String travelEnd;
	private char travelPrivacy;
	private char free;
	private int viewCnt;
	private int shareCnt;
	private String writer;
	private Date writeDate;
	private String travelDate;
	private String placeId;
	private String memo;
	private String placeName;
	private String fileSavedName;
	private String originalTravelId;
	private String originalWriter;
	private String memberId;
	
	// weather vo
		private String lat;
		private String lon;
		private String locationSi;
	
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getTravelId() {
		return travelId;
	}
	public void setTravelId(String travelId) {
		this.travelId = travelId;
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
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public Date getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
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
	public String getPlaceName() {
		return placeName;
	}
	public void setPlaceName(String placeName) {
		this.placeName = placeName;
	}
	public String getFileSavedName() {
		return fileSavedName;
	}
	public void setFileSavedName(String fileSavedName) {
		this.fileSavedName = fileSavedName;
	}
	public String getOriginalTravelId() {
		return originalTravelId;
	}
	public void setOriginalTravelId(String originalTravelId) {
		this.originalTravelId = originalTravelId;
	}
	public String getOriginalWriter() {
		return originalWriter;
	}
	public void setOriginalWriter(String originalWriter) {
		this.originalWriter = originalWriter;
	}
	
	public String getLat() {
		return lat;
	}
	public void setLat(String lat) {
		this.lat = lat;
	}
	public String getLon() {
		return lon;
	}
	public void setLon(String lon) {
		this.lon = lon;
	}
	public String getLocationSi() {
		return locationSi;
	}
	public void setLocationSi(String locationSi) {
		this.locationSi = locationSi;
	}
	
	@Override
	public String toString() {
		return "TravelVo [travelId=" + travelId + ", travelTitle=" + travelTitle + ", travelStart=" + travelStart
				+ ", travelEnd=" + travelEnd + ", travelPrivacy=" + travelPrivacy + ", free=" + free + ", viewCnt="
				+ viewCnt + ", shareCnt=" + shareCnt + ", writer=" + writer + ", writeDate=" + writeDate
				+ ", travelDate=" + travelDate + ", placeId=" + placeId + ", memo=" + memo + ", placeName=" + placeName
				+ ", fileSavedName=" + fileSavedName + ", originalTravelId=" + originalTravelId + ", originalWriter="
				+ originalWriter + ", memberId=" + memberId + ", lat=" + lat + ", lon=" + lon + ", locationSi="
				+ locationSi + "]";
	}

	
	
	
	
}
