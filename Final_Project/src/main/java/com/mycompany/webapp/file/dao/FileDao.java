package com.mycompany.webapp.file.dao;
import org.apache.ibatis.annotations.Mapper;

import com.mycompany.webapp.file.model.FileVo;

@Mapper
public interface FileDao {
	
	int count();
	void insertFile(FileVo file);
	void insertUserFile(FileVo file);
	void userImageFile(FileVo file);
}
