package com.mycompany.webapp.travel.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.webapp.place.model.PlaceVo;
import com.mycompany.webapp.place.service.PlaceService;
import com.mycompany.webapp.travel.model.TravelVo;
import com.mycompany.webapp.travel.service.TravelService;

@Controller
public class TravelController {

	@Autowired
	private TravelService travelService;
	
	@Autowired
	private PlaceService placeService;

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

/*	@RequestMapping("/travel/placelist")
	public String placeList(Model model) {

		List<PlaceVo> travelList = travelService.selectPlaceList();
		model.addAttribute("placeList", travelList);
		return "travel/travelinsert";
	}*/

}
