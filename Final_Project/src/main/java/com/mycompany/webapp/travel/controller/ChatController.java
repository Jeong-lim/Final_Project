package com.mycompany.webapp.travel.controller;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ChatController {
	@ResponseBody
	@RequestMapping(value = "/chat.action", method = { RequestMethod.GET })
	public String chat (HttpServletRequest req, HttpServletResponse resp, HttpSession session) {
		
		return "main";
	}
}