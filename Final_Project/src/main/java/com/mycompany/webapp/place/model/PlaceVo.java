package com.mycompany.webapp.place.model;

public class PlaceVo {
	private String placeId;
	private String placeName;
	private String areaName;
	private String category;
	private String fileNo;
	
	
	
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
	@Override
	public String toString() {
		return "PlaceVo [placeId=" + placeId + ", placeName=" + placeName + ", areaName=" + areaName + ", category="
				+ category + ", fileNo=" + fileNo + "]";
	}
	
	

	
	
}
