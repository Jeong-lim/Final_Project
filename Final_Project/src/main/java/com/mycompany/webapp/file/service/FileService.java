package com.mycompany.webapp.file.service;

import javax.annotation.Resource;

import org.apache.taglibs.standard.lang.jstl.test.beans.PublicBean1;
import org.springframework.beans.factory.annotation.Autowired;
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
	public void insertUserImage(FileVo file) {
		fileDao.insertUserImage(file);
	}
	
	public FileVo selectUserImage(String userName) {
		return fileDao.selectUserImage(userName);
	}
	
	public void deleteUserImage(String userName) {
		fileDao.deleteUserImage(userName);
	}
		
		
		
		

}
