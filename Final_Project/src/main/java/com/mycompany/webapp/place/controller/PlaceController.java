package com.mycompany.webapp.place.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycompany.webapp.place.model.PagerVo;
import com.mycompany.webapp.place.model.PlaceVo;
import com.mycompany.webapp.place.service.PlaceService;

@Controller
public class PlaceController {
	
	private static final Logger logger = LoggerFactory.getLogger(PlaceController.class);
	

	@Autowired
	private PlaceService placeService;
	

	@RequestMapping("/place")
	public String place(@RequestParam(defaultValue="THE00030")String category,@RequestParam(defaultValue="1") int pageNo,Model model) {
		System.out.println(pageNo);
		System.out.println(category);
		int totalRows=placeService.countPlace(category); //카테고리별 전체 행
		
		
		PagerVo pager=new PagerVo(10,5,totalRows,pageNo); // pager 생성 한페이지에 10개씩, 5페이지씩,전체 행, 보고싶은 페이지
		int endRowNo=pager.getEndRowNo();
		int startRowNo=pager.getStartRowNo();
		List<PlaceVo> placeList=placeService.selectPlaceList(category, endRowNo, startRowNo);
		model.addAttribute("pager",pager);
		model.addAttribute("placeList",placeList);
		model.addAttribute("category", category);
		
		return "place/placelist";
	}  
	
	@RequestMapping("/searchPlace")
	public String searchPlace(HttpServletRequest request,@RequestParam(defaultValue="1") int pageNo,Model model) {
		String key=request.getParameter("key");
		String keyword="전주";
		System.out.println(key);
		System.out.println(keyword);
		int totalRows=placeService.countKeyword(key, keyword);
		System.out.println(totalRows);
		PagerVo pager=new PagerVo(10,5,totalRows,pageNo);
		int endRowNo=pager.getEndRowNo();
		int startRowNo=pager.getStartRowNo();
		List<PlaceVo> placeList=placeService.KeyworePlaceSearch(key, keyword, endRowNo, startRowNo);
		model.addAttribute("pager",pager);
		model.addAttribute("placeList",placeList);
		
		
		return "place/placelist";
	}
	
	
	
	


	
	
	@RequestMapping("/place/detail")
	public String placeDetail() {
		return "place/placedetail";
	}
	
	


}
