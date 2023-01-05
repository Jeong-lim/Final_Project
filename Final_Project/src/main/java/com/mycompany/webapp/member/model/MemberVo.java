package com.mycompany.webapp.member.model;


import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class MemberVo {
	private String memberId;
	private String memberName;
	private String memberPassword;
	private String phoneNumber;
	private String email;
	private MultipartFile memberImage;
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
	public MultipartFile getMemberImage() {
		return memberImage;
	}
	public void setMemberImage(MultipartFile memberImage) {
		this.memberImage = memberImage;
	}
	@Override
	public String toString() {
		return "MemberVo [memberId=" + memberId + ", memberName=" + memberName + ", memberPassword=" + memberPassword
				+ ", phoneNumber=" + phoneNumber + ", email=" + email + ", memberImage=" + memberImage + "]";
	}
	
	
}