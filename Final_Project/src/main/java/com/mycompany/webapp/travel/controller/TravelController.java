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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycompany.webapp.file.model.FileVo;
import com.mycompany.webapp.member.controller.MemberController;
import com.mycompany.webapp.member.model.MemberVo;
import com.mycompany.webapp.place.model.PagerVo;
import com.mycompany.webapp.place.model.PlaceVo;
import com.mycompany.webapp.travel.model.Search;
import com.mycompany.webapp.travel.model.TravelVo;
import com.mycompany.webapp.travel.service.TravelService;

@Controller
public class TravelController {
	private static final Logger logger = LoggerFactory.getLogger(TravelController.class);

	@Autowired
	private TravelService travelService;

	@RequestMapping("/travel/detail")
	public String travelDetail() {
		return "travel/traveldetail";
	}

	@ResponseBody
	@PostMapping(value = "/travel/insert1")
	public String insertTravel(Model model, HttpSession session,
			@RequestParam(value = "value", required = false) String travelStart,
			@RequestParam(value = "value2", required = false) String travelEnd,
			@RequestParam(value = "value3", required = false) String travelTitle,
			@RequestParam(value = "value4", required = false) char travelPrivacy) {

		String memberId = (String) session.getAttribute("memberId");
		logger.info(memberId);
		if (memberId != null && !memberId.equals("")) {

			System.out.println(travelTitle);
			System.out.println(travelPrivacy);
			System.out.println(travelStart);
			System.out.println(travelEnd);
			System.out.println(memberId);
			travelService.insertTravel(memberId, travelTitle, travelPrivacy, travelStart, travelEnd);
			System.out.println("왜입력안댐???");
			//https://conanglog.tistory.com/120
			return "travel/traveldetail";

		} else {
			// userid가 세션에 없을 때 (로그인하지 않았을 때)
			model.addAttribute("message", "로그인이 필요합니다.");
			return "auth/signin";

		}

	}

	/*
	 * @ResponseBody
	 * 
	 * @PostMapping(value = "/travel/insert/test") public String
	 * insertTest(@ModelAttribute TravelVo model, HttpSession session, Model model3,
	 * 
	 * @ModelAttribute TravelVo model2, @RequestParam(value = "value", required =
	 * false) String travelStart,
	 * 
	 * @RequestParam(value = "value2", required = false) String travelEnd) {
	 * 
	 * String memberId = (String) session.getAttribute("memberId");
	 * logger.info(memberId); if (memberId != null && !memberId.equals("")) { String
	 * travelTitle = model.getTravelTitle(); char travelPrivacy =
	 * model2.getTravelPrivacy(); logger.info(travelTitle);
	 * System.out.println(travelPrivacy); System.out.println(travelStart);
	 * System.out.println(travelEnd); // TravelService.insertTravel(traveltitle);
	 * return "ok";
	 * 
	 * } else { // userid가 세션에 없을 때 (로그인하지 않았을 때) model3.addAttribute("message",
	 * "로그인이 필요합니다."); return "auth/signin";
	 * 
	 * }
	 * 
	 * }
	 */

	@RequestMapping("/travel/insert")
	public String travelInsert(Model model) {
		List<PlaceVo> placeList = travelService.selectPlaceList();
		model.addAttribute("placeList", placeList);
		return "travel/travelinsert";
	}

	// 여행 입력 페이지의 관광지 선택 모달 검색
	@RequestMapping(value = "/travel/insert/placelist")
	public @ResponseBody List<PlaceVo> travelInsert(@RequestParam("searchType") String searchType,
			@RequestParam("keyword") String keyword, Model model) {
		model.addAttribute("searchType", searchType);
		model.addAttribute("keyword", keyword);
		logger.info(searchType);
		logger.info(keyword);
		List<PlaceVo> placeList = travelService.selectTravelListByArea(searchType, keyword);
		model.addAttribute("placeList", placeList);

		return placeList;
	}

	// 여행 일정 리스트
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

		logger.info("여행리스트");
		return "travel/travellist";
	}

	// 여행 일정 리스트의 조회수 순 정렬
	@RequestMapping(value = "/travel/viewCnt/list", method = RequestMethod.GET)
	public String getTravelListByView(@RequestParam(defaultValue = "1") int pageNo, Model model) {

		int totalRows = travelService.countTravel();
		PagerVo pager = new PagerVo(10, 5, totalRows, pageNo);
		List<TravelVo> travelList = travelService.selectTravelListByView(pager);
		model.addAttribute("pager", pager);
		model.addAttribute("travelList", travelList);

		String category = "viewCnt";
		model.addAttribute(category);
		logger.info(category);

		logger.info("조회수");
		return "travel/travellist";
	}

	// 여행 일정 리스트 인기 순 정렬
	@RequestMapping(value = "/travel/shareCnt/list", method = RequestMethod.GET)
	public String getTravelListByShare(@RequestParam(defaultValue = "1") int pageNo, Model model) {

		int totalRows = travelService.countTravel();
		PagerVo pager = new PagerVo(10, 5, totalRows, pageNo);
		List<TravelVo> travelList = travelService.selectTravelListByShare(pager);
		model.addAttribute("pager", pager);
		model.addAttribute("travelList", travelList);
		String category = "shareCnt";
		model.addAttribute(category);
		logger.info(category);

		logger.info("공유수");
		return "travel/travellist";
	}

	// 여행 일정 리스트 최신 순 정렬
	@RequestMapping(value = "/travel/recent/list", method = RequestMethod.GET)
	public String getTravelListByRecent(@RequestParam(defaultValue = "1") int pageNo, Model model) {

		int totalRows = travelService.countTravel();
		PagerVo pager = new PagerVo(10, 5, totalRows, pageNo);
		List<TravelVo> travelList = travelService.selectTravelListByRecent(pager);
		model.addAttribute("pager", pager);
		model.addAttribute("travelList", travelList);

		String category = "recent";
		model.addAttribute(category);
		logger.info(category);

		logger.info("최신순");
		return "travel/travellist";
	}

	// 여행 일정 리스트 검색
	@RequestMapping(value = "/travel/search/list", method = RequestMethod.GET)
	public String getTravelListBySearch(@RequestParam(defaultValue = "1") int pageNo,
			@RequestParam(required = false, defaultValue = "title") String searchType,
			@RequestParam(required = false) String keyword, Model model) {

		int totalRows = travelService.countTravelSearch(searchType, keyword);
		PagerVo pager = new PagerVo(10, 5, totalRows, pageNo);
		int endRowNo = pager.getEndRowNo();
		int startRowNo = pager.getStartRowNo();

		List<TravelVo> travelList = travelService.selectTravelListByKeyword(endRowNo, startRowNo, searchType, keyword);

		model.addAttribute("pager", pager);
		model.addAttribute("travelList", travelList);

		model.addAttribute("searchType", searchType);
		model.addAttribute("keyword", keyword);

		logger.info("검색리스트");
		return "travel/travellist";
	}

}
