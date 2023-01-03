package com.mycompany.webapp.place.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.webapp.place.service.PlaceService;

@Controller
public class PlaceController {

	@Autowired
	private PlaceService placeService;

	@RequestMapping("/place")
	public String place() {
		System.out.println("check");
		placeService.countPlace();
		System.out.println(placeService.countPlace());
		return "place/placelist";
	}
	
	@RequestMapping("/place/detail")
	public String placeDetail() {
		return "place/placedetail";
	}

}
