package com.mycompany.webapp.user.controller;

<<<<<<< HEAD
import javax.servlet.http.HttpSession;
=======
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.webapp.user.service.UserService;

@Controller
public class UserController {
>>>>>>> branch 'master' of https://github.com/Jeong-lim/Final_Project.git

<<<<<<< HEAD
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
	
=======
	@Autowired
	private UserService userService;

	@RequestMapping("/signin")
	public String signIn() {
		return "auth/signin";
	}

	@RequestMapping("/signup")
	public String signUp() {
		return "auth/signup";
	}

	@RequestMapping("/mypage")
	public String myPage() {
		return "user/mypage";
	}

	@RequestMapping("/mypage/update")
	public String myPageUpdate() {
		return "user/mypageupdate";
	}

>>>>>>> branch 'master' of https://github.com/Jeong-lim/Final_Project.git
}
