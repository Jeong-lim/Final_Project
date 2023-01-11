package com.mycompany.webapp.file.dao;
import org.apache.ibatis.annotations.Mapper;

import com.mycompany.webapp.file.model.FileVo;

@Mapper
public interface FileDao {
	
	int count();
	public void insertFile(FileVo file);
	public void insertUserImage(FileVo file);
	public FileVo selectUserImage(String userName);
	void deleteUserImage(String userName);
}
