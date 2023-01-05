package com.mycompany.webapp.file.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import com.mycompany.webapp.file.dao.FileDao;
import com.mycompany.webapp.file.model.FileVo;

@Service
public class FileService {
	
	
	
	@Resource
	private FileDao fileDao;
	
	public int countFile() {
		return fileDao.count();
	}
	
	public void insertFile(FileVo file) {
		fileDao.insertFile(file);
		
	}
		
		
		
		

}
