package com.mycompany.webapp.travel.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.mycompany.webapp.file.model.FileVo;
import com.mycompany.webapp.file.service.FileService;
import com.mycompany.webapp.member.model.MemberVo;
import com.mycompany.webapp.place.model.PagerVo;
import com.mycompany.webapp.place.model.PlaceVo;
import com.mycompany.webapp.travel.model.Search;
import com.mycompany.webapp.travel.model.TravelVo;
import com.mycompany.webapp.travel.service.TravelService;

@Controller
public class TravelController {
	private static final Logger log = LoggerFactory.getLogger(TravelController.class);

	@Autowired
	private TravelService travelService;
	@Autowired
	private FileService fileService;

	@RequestMapping("/travel/detail")
	public String travelDetail() {
		
		System.out.println("check");
		return "travel/traveldetail";
	}

/*	@RequestMapping("/travel/placelist")
	public String travelInsert(Model model) {
		List<PlaceVo> placeList = travelService.selectPlaceList();
		model.addAttribute("placeList", placeList);
		System.out.println("www");
		return "travel/travelinsert";
	}*/

	@RequestMapping("/travel/insert")
	public String travelInsert(@RequestParam(required = false) String searchType,
			@RequestParam(required = false) String keyword,Model model) {
		List<PlaceVo> placeList = travelService.selectTravelListByArea(searchType,keyword);
		model.addAttribute("placeList", placeList);
		model.addAttribute("searchType", searchType);
		model.addAttribute("keyword", keyword);
		return "travel/travelinsert";
	}

/*	@RequestMapping("/travel/placelist")
	public String selectPlaceListByArea(@RequestParam(required = false, defaultValue = "title") String searchType,
			@RequestParam(required = false) String keyword, Model model) {
		List<PlaceVo> placeListByArea = travelService.selectPlaceListByArea(searchType,keyword);
		model.addAttribute("placeList", placeListByArea);
		model.addAttribute("searchType", searchType);
		model.addAttribute("keyword", keyword);
		return "travel/travelinsert";
	}*/

	@RequestMapping(value = "/travel/list", method = RequestMethod.GET)
	public String getTravelList(@RequestParam(defaultValue = "1") int pageNo, Model model) {
		// 페이징 대상이 되는 전체 행 수
		int totalRows = travelService.countTravel();
		// 페이징 정보가 담긴 pager 객체 생성
		PagerVo pager = new PagerVo(10, 5, totalRows, pageNo);

		// 해당 페이지의 행을 가져오기
		List<TravelVo> travelList = travelService.selectTravelList(pager);

		// JSP에서 사용할 데이터를 저장
		model.addAttribute("pager", pager);
		model.addAttribute("travelList", travelList);
		
		System.out.println("ddd");
		return "travel/travellist";
	}

	@RequestMapping(value = "/travel/viewCnt/list", method = RequestMethod.GET)
	public String getTravelListByView(@RequestParam(defaultValue = "1") int pageNo, Model model) {

		int totalRows = travelService.countTravel();
		PagerVo pager = new PagerVo(10, 5, totalRows, pageNo);
		List<TravelVo> travelList = travelService.selectTravelListByView(pager);
		model.addAttribute("pager", pager);
		model.addAttribute("travelList", travelList);

		String category = "viewCnt";
		model.addAttribute(category);
		System.out.println(category);

		System.out.println("ddd2");
		return "travel/travellist";
	}

	@RequestMapping(value = "/travel/shareCnt/list", method = RequestMethod.GET)
	public String getTravelListByShare(@RequestParam(defaultValue = "1") int pageNo, Model model) {

		int totalRows = travelService.countTravel();
		PagerVo pager = new PagerVo(10, 5, totalRows, pageNo);
		List<TravelVo> travelList = travelService.selectTravelListByShare(pager);
		model.addAttribute("pager", pager);
		model.addAttribute("travelList", travelList);
		String category = "shareCnt";
		model.addAttribute(category);
		System.out.println(category);

		System.out.println("ddd3");
		return "travel/travellist";
	}

	@RequestMapping(value = "/travel/recent/list", method = RequestMethod.GET)
	public String getTravelListByRecent(@RequestParam(defaultValue = "1") int pageNo, Model model) {

		int totalRows = travelService.countTravel();
		PagerVo pager = new PagerVo(10, 5, totalRows, pageNo);
		List<TravelVo> travelList = travelService.selectTravelListByRecent(pager);
		model.addAttribute("pager", pager);
		model.addAttribute("travelList", travelList);

		String category = "recent";
		model.addAttribute(category);
		System.out.println(category);

		System.out.println("ddd4");
		return "travel/travellist";
	}

	@RequestMapping(value = "/travel/search/list", method = RequestMethod.GET)
	public String getTravelListBySearch(@RequestParam(defaultValue = "1") int pageNo,
			@RequestParam(required = false, defaultValue = "title") String searchType,
			@RequestParam(required = false) String keyword, Model model) {

		int totalRows = travelService.countTravelSearch(searchType, keyword);
		PagerVo pager = new PagerVo(10, 5, totalRows, pageNo);
		int endRowNo = pager.getEndRowNo();
		int startRowNo = pager.getStartRowNo();
		System.out.println(totalRows);

		List<TravelVo> travelList = travelService.selectTravelListByKeyword(endRowNo, startRowNo, searchType, keyword);

		model.addAttribute("pager", pager);
		model.addAttribute("travelList", travelList);

		model.addAttribute("searchType", searchType);
		model.addAttribute("keyword", keyword);

		System.out.println("ddd5");
		return "travel/travellist";
	}

}
