package com.mycompany.webapp.member.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mycompany.webapp.member.model.MemberVo;
import com.mycompany.webapp.member.service.MemberService;

@Controller
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value = "/signup", method=RequestMethod.GET)
	public String joinForm() {
		return "auth/signup";
	}
	
	@RequestMapping(value = "/signup", method=RequestMethod.POST)
	public String memberInsert(MemberVo member, HttpSession session) {
		memberService.insertMember(member);
		session.invalidate();
		return "auth/signin";
	}
}