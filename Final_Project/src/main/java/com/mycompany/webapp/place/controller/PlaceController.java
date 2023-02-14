package com.mycompany.webapp.place.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
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

	//관광지 리스트페이지
	@RequestMapping("/place")
	public String place(@RequestParam(defaultValue = "THE00030")String category
					   ,@RequestParam(defaultValue = "1")int pageNo
					   ,Model model) {
		int totalRows = placeService.countPlace(category); // 카테고리별 전체 행
		PagerVo pager = new PagerVo(10, 5, totalRows, pageNo); // pager 생성 한페이지에 10개씩, 5페이지씩,전체 행, 보고싶은 페이지
		int endRowNo = pager.getEndRowNo();
		int startRowNo = pager.getStartRowNo();
		List<PlaceVo> placeList = placeService.selectPlaceList(category, endRowNo, startRowNo);//관광지 리스트
		model.addAttribute("pager", pager);
		model.addAttribute("placeList", placeList);
		model.addAttribute("category", category);
		return "place/placelist";
	}

	//관광지 검색
	@RequestMapping("/searchPlace")
	public String searchPlace(@RequestParam(required = false)String key
							 ,@RequestParam(required = false)String keyword
							 ,@RequestParam(defaultValue = "1")int pageNo
							 ,Model model) {
		int totalRows = placeService.countKeyword(key, keyword); //전체 검색결과 수
		if (totalRows != 0) { //검색결과가 있을 때
			PagerVo pager = new PagerVo(10, 5, totalRows, pageNo);
			int endRowNo = pager.getEndRowNo();
			int startRowNo = pager.getStartRowNo();
			List<PlaceVo> placeList = placeService.KeywordPlaceSearch(key, keyword, endRowNo, startRowNo);
			model.addAttribute("pager", pager);
			model.addAttribute("placeList", placeList);
			model.addAttribute("key", key);
			model.addAttribute("keyword", keyword);
		} else { //검색결과가 없을 때
			String message = "검색하신 조건의 결과가 없습니다.";
			model.addAttribute("message", message);
		}
		return "place/placelist";
	}

	//관광지 상세페이지
	@RequestMapping("/place/detail/{placeName}")
	public String placeDetail(@PathVariable("placeName")String placeName
							 ,Model model) {
		List<PlaceVo> placeInfoList = placeService.detailPlaceInfo(placeName); //관광지 상세 사진리스트
		PlaceVo place = placeService.placeInfo(placeName); //관광지 정보
		model.addAttribute("placeInfoList", placeInfoList);
		model.addAttribute("place", place);
		return "place/placedetail";
	}

	//추천관광지리스트
	@ResponseBody
	@PostMapping("/selectPlaceList")
	public List<PlaceVo> selectPlaceList(@RequestParam("city")String city
										,@RequestParam("lat")String lat
										,@RequestParam("lng")String lng
										,@RequestParam("weather")String weather
										,@RequestParam("temp")double temp
										,@RequestParam("air")int air)throws Exception {
		String indoor;
		if(air<=3 && "Clear".equals(weather)){
			indoor="실외";
			List<PlaceVo> recomandPlace = placeService.selectPlaceDistance(lat, lng, indoor); //추천 관광지 리스트
			return recomandPlace;
		}
		else if(temp<10.0) {
			indoor="실내";
			List<PlaceVo> recomandPlace = placeService.selectPlaceDistance(lat, lng, indoor); //추천 관광지 리스트
			return recomandPlace;
		}
		else {
			indoor="실내";
			List<PlaceVo> recomandPlace = placeService.selectPlaceDistance(lat, lng, indoor); //추천 관광지 리스트
			return recomandPlace;
		}
	}
	
	@RequestMapping("/product")
	public String buyProduct() {
		return "common/product";
	}
	
	@RequestMapping("/productDetail")
	public String productDetail(HttpServletRequest request,Model model) {
		String img=(String)request.getParameter("img");
		String title=(String)request.getParameter("title");
		String price=(String)request.getParameter("price");
		String pname=(String) request.getParameter("pname");
		String pprice=(String) request.getParameter("pprice");
		String pcode=(String)request.getParameter("pcode");
		model.addAttribute("img",img);
		model.addAttribute("title",title);
		model.addAttribute("price",price);
		model.addAttribute("pname",pname);
		model.addAttribute("pprice",pprice);
		model.addAttribute("pcode",pcode);
		
		return "common/productDetail";
	}

}
