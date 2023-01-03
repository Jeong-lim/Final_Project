package com.mycompany.webapp.user.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mycompany.webapp.user.model.UserVo;
import com.mycompany.webapp.user.service.UserService;

@Controller
public class UserController {
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Autowired
	private UserService userService;
	
	@RequestMapping(value = "/signup", method=RequestMethod.GET)
	public String joinForm() {
		return "auth/signup";
	}
	
	@RequestMapping(value = "/signup", method=RequestMethod.POST)
	public String userInsert(UserVo user, HttpSession session) {
		userService.insertUser(user);
		session.invalidate();
		return "auth/signin";
	}
}