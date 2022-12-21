package com.mycompany.webapp.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import lombok.extern.log4j.Log4j2;

@Controller
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
	
	@RequestMapping("/myPage")
	public String myPage() {
		return "user/mypage";
	}
	
	@RequestMapping("/mypageUpdate")
	public String myPageUpdate() {
		return "user/mypageupdate";
	}
	
	@RequestMapping("/place")
	public String place() {
		return "place/placelist";
	}
	
	@RequestMapping("/placeDetail")
	public String placeDetail() {
		return "place/placedetail";
	}
	
	@RequestMapping("/travelDetail")
	public String travelDetail() {
		return "travel/traveldetail";
	}
	
	@RequestMapping("/travelInsert")
	public String travelInsert() {
		return "travel/travelinsert";
	}
	
	@RequestMapping("/travelList")
	public String travelList() {
		return "travel/travellist";
	}
	
}

