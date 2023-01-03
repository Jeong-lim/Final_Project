package com.mycompany.webapp.user.service;

<<<<<<< HEAD
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
=======
import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import com.mycompany.webapp.user.dao.UserDao;

@Service
public class UserService {
>>>>>>> branch 'master' of https://github.com/Jeong-lim/Final_Project.git

<<<<<<< HEAD
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
=======
	private static final Logger logger = LoggerFactory.getLogger(UserService.class);

	@Resource
	private UserDao userDao;

	public int countUser() {
		return userDao.count();

	}

>>>>>>> branch 'master' of https://github.com/Jeong-lim/Final_Project.git
}
