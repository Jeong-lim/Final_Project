package com.mycompany.webapp.file.model;

import org.springframework.web.multipart.MultipartFile;

public class FileVo {
	private String uploadRoot;
	private String fileOriginalName;
	private String fileSavedName;
	private String fileName;
	private MultipartFile attach;
	
	public String getUploadRoot() {
		return uploadRoot;
	}
	public void setUploadRoot(String uploadRoot) {
		this.uploadRoot = uploadRoot;
	}
	public String getFileOriginalName() {
		return fileOriginalName;
	}
	public void setFileOriginalName(String fileOriginalName) {
		this.fileOriginalName = fileOriginalName;
	}
	public String getFileSavedName() {
		return fileSavedName;
	}
	public void setFileSavedName(String fileSavedName) {
		this.fileSavedName = fileSavedName;
	}
	
	
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public MultipartFile getAttach() {
		return attach;
	}
	public void setAttach(MultipartFile attach) {
		this.attach = attach;
	}
	@Override
	public String toString() {
		return "FileVo [uploadRoot=" + uploadRoot + ", fileOriginalName=" + fileOriginalName + ", fileSavedName="
				+ fileSavedName + ", fileName=" + fileName + ", attach=" + attach + "]";
	}
	
	
	
	
	
}
