package com.mycompany.webapp.file.service;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import com.mycompany.webapp.file.dao.FileDao;

@Service
public class FileService {
	
	private static final Logger logger = LoggerFactory.getLogger(FileService.class);
	
	@Resource
	private FileDao fileDao;
	
	public int countFile() {
		return fileDao.count();
		
		
		
		
	}

}
