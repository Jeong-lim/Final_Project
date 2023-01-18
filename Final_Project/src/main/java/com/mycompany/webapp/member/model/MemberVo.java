package com.mycompany.webapp.member.model;



import lombok.Data;

@Data
public class MemberVo {
	private String memberId;
	private String memberName;
	private String memberPassword;
	private String phoneNumber;
	private String email;
	private String travelTitle;
	private String travelStart;
	private String travelEnd;
	private String viewCount;
	private String shareCount;
	private String categoryName;
	private String fileSavedName;
	private String status;
	
	
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getMemberPassword() {
		return memberPassword;
	}
	public void setMemberPassword(String memberPassword) {
		this.memberPassword = memberPassword;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
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
	public String getViewCount() {
		return viewCount;
	}
	public void setViewCount(String viewCount) {
		this.viewCount = viewCount;
	}
	public String getShareCount() {
		return shareCount;
	}
	public void setShareCount(String shareCount) {
		this.shareCount = shareCount;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	
	public String getFileSavedName() {
		return fileSavedName;
	}
	public void setFileSavedName(String fileSavedName) {
		this.fileSavedName = fileSavedName;
	}
	
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "MemberVo [memberId=" + memberId + ", memberName=" + memberName + ", memberPassword=" + memberPassword
				+ ", phoneNumber=" + phoneNumber + ", email=" + email + ", travelTitle=" + travelTitle
				+ ", travelStart=" + travelStart + ", travelEnd=" + travelEnd + ", viewCount=" + viewCount
				+ ", shareCount=" + shareCount + ", categoryName=" + categoryName + ", fileSavedName=" + fileSavedName
				+ ", status=" + status + "]";
	}
	
	

	
	
	

	
}