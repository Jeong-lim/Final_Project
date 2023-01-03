package com.mycompany.webapp.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import lombok.extern.log4j.Log4j2;


@Log4j2
public class HomeController {

	@RequestMapping("/")
	public String main() {
		//logger.info("실행");
//		log.info("실행");
		return "main";
	}
	
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
	
	@RequestMapping("/place")
	public String place() {
		return "place/placelist";
	}
	
	@RequestMapping("/place/detail")
	public String placeDetail() {
		return "place/placedetail";
	}
	
	@RequestMapping("/travel/detail")
	public String travelDetail() {
		return "travel/traveldetail";
	}
	
	@RequestMapping("/travel/insert")
	public String travelInsert() {
		return "travel/travelinsert";
	}
	
	@RequestMapping("/travel/list")
	public String travelList() {
		return "travel/travellist";
	}
	
}

