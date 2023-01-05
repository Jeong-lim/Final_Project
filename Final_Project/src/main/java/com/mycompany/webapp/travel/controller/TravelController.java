package com.mycompany.webapp.travel.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.webapp.travel.service.TravelService;

@Controller
public class TravelController {

	@Autowired
	private TravelService travelService;

	@RequestMapping("/travel/detail")
	public String place() {
		System.out.println("check");
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
