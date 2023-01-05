package com.mycompany.webapp.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.webapp.user.service.UserService;

@Controller
public class UserController {

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

}
