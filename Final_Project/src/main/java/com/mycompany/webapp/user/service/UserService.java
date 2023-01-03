package com.mycompany.webapp.user.service;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.webapp.user.dao.UserDao;
import com.mycompany.webapp.user.model.UserVo;

@Service
public class UserService  {
	private static final Logger logger = LoggerFactory.getLogger(UserService.class);

	@Autowired
	private UserDao userDao;
	
	public void insertUser(UserVo user) {
		userDao.insertUser(user);
	}


}
