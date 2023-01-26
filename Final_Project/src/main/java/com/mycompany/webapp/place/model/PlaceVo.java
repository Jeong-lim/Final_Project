package com.mycompany.webapp.place.model;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class PlaceVo {
	private String placeId; //장소아이디
	private String placeName; //장소이름
	private String areaName; //지역이름
	private String category; //카테고리
	private String fileNo; //관광지 사진 번호
	private String fileSavedName; //관광지 사진파일이름
	private String placeDetail; //장소설명
	
	
	
	public String getPlaceId() {
		return placeId;
	}
	public void setPlaceId(String placeId) {
		this.placeId = placeId;
	}
	public String getPlaceName() {
		return placeName;
	}
	public void setPlaceName(String placeName) {
		this.placeName = placeName;
	}
	public String getAreaName() {
		return areaName;
	}
	public void setAreaName(String areaName) {
		this.areaName = areaName;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getFileNo() {
		return fileNo;
	}
	public void setFileNo(String fileNo) {
		this.fileNo = fileNo;
	}
	public String getFileSavedName() {
		return fileSavedName;
	}
	public void setFileSavedName(String fileSavedName) {
		this.fileSavedName = fileSavedName;
	}
	
	public String getPlaceDetail() {
		return placeDetail;
	}
	public void setPlaceDetail(String placeDetail) {
		this.placeDetail = placeDetail;
	}
	@Override
	public String toString() {
		return "PlaceVo [placeId=" + placeId + ", placeName=" + placeName + ", areaName=" + areaName + ", category="
				+ category + ", fileNo=" + fileNo + ", fileSavedName=" + fileSavedName + ", placeDetail=" + placeDetail
				+ "]";
	}
	
	
	
	
	
	
	

	
	
}
