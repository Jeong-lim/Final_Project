package com.mycompany.webapp.place.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mycompany.webapp.place.model.PagerVo;
import com.mycompany.webapp.place.model.PlaceVo;
import com.mycompany.webapp.place.service.PlaceService;

@Controller
public class PlaceController {

	@Autowired
	private PlaceService placeService;
	

	@RequestMapping("/place")
	public String place(@RequestParam(defaultValue="1") int pageNo,Model model) {
		int totalRows=placeService.countPlace(); //전체 행
		
		PagerVo pager=new PagerVo(10,5,totalRows,pageNo); // pager 생성 한페이지에 10개씩, 5페이지씩,전체 행, 보고싶은 페이지
		
		List<PlaceVo> placeList=placeService.selectPlaceList(pager);
		
		model.addAttribute("pager",pager);
		model.addAttribute("placeList",placeList);
		
		
		return "place/placelist";
	}  


	
	
	@RequestMapping("/place/detail")
	public String placeDetail() {
		return "place/placedetail";
	}
	
	


}
