package com.mycompany.webapp.travel.controller;

import java.util.Arrays;
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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycompany.webapp.file.model.FileVo;
import com.mycompany.webapp.file.service.FileService;
import com.mycompany.webapp.member.controller.MemberController;
import com.mycompany.webapp.member.model.MemberVo;
import com.mycompany.webapp.member.service.MemberService;
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

	@Autowired
	private FileService fileService;
	
	@Autowired
	private MemberService memberService;

	@RequestMapping("/travel/{travelId}/{memberId}")
	public String travelDetail(@PathVariable("travelId") String travelId, @PathVariable("memberId") String memberId,
			Model model, HttpServletRequest request) {
		TravelVo travel = travelService.selectTravel(memberId, travelId);

		HttpSession session = request.getSession();
		String sessionId = (String) session.getAttribute("memberId");

		String privacy = travel.getTravelPrivacy();
		if (sessionId != null) { // 로그인이 된 상태인지 확인하기

			// 팔로우상태 체크
			String status = memberService.checkFollowStatus(memberId, sessionId);
			model.addAttribute("follow", status);
			logger.info(status);

			if (travel != null) {
				model.addAttribute("travelTitle", travel.getTravelTitle());
				model.addAttribute("startDate", travel.getTravelStart());
				model.addAttribute("endDate", travel.getTravelEnd());
				model.addAttribute("writer", travel.getWriter());
				model.addAttribute("viewCnt", travel.getViewCnt());
				model.addAttribute("shareCnt", travel.getShareCnt());
				model.addAttribute("travelPrivacy", travel.getTravelPrivacy());
				

				FileVo fileVo = fileService.selectUserImage(memberId);
				if (fileVo != null) {
					String fileSavedName = fileVo.getFileSavedName();
					model.addAttribute("fileSavedName", fileSavedName);
				}

				List<Map<String, String>> detailList = travelService.selectTravelDetail(travelId);
				List<Map<String, String>> detailTravel = travelService.selectTravelPlace(travelId);
				logger.info(detailList.toString());
				logger.info(detailTravel.toString());
				model.addAttribute("detailList", detailList);
				model.addAttribute("detailTravel", detailTravel);

				model.addAttribute("detailList", detailList);

			}

		} else {
			model.addAttribute("message", "회원만 게시글을 열람할 수 있습니다.");
			return "auth/signin";
		}

		return "travel/traveldetail";

	}
	@ResponseBody
	@PostMapping(value = "/travel/insertTravel")
	public String insertTravel(Model model, HttpSession session,
			@RequestParam(value = "value", required = false) String travelStart,
			@RequestParam(value = "value2", required = false) String travelEnd,
			@RequestParam(value = "value3", required = false) String travelTitle,
			@RequestParam(value = "value4", required = false) char travelPrivacy) {

			String memberId = (String) session.getAttribute("memberId");
			
			travelService.insertTravel(memberId, travelTitle, travelPrivacy, travelStart, travelEnd);

			return "ok";

	}
	
	@ResponseBody
	@RequestMapping(value="/travel/insertTravelDetail", method=RequestMethod.POST)
	public String insertTravel(Model model, HttpServletRequest request,  @RequestParam String[] placeName) {
			
			System.out.println("--------------------");
			String travelDate=request.getParameter("travelDate");
			String memo=request.getParameter("memo");
			
			System.out.println(Arrays.toString(placeName));
			System.out.println(travelDate);
			System.out.println(memo);
			String travelId=null;

			
		for (int i = 0; i < placeName.length; i++) {
			System.out.println(placeName[i]);
			String placeName1=placeName[i];
			TravelVo travelvo=travelService.findLastTravelId(placeName1);
			travelId=travelvo.getTravelId();
			String placeId=travelvo.getPlaceId();
			System.out.println(travelId);
			System.out.println(placeId);
			travelService.insertTravelDetail(travelId, travelDate, placeId, memo);
		}

			return travelId;

	}

	@RequestMapping("/travel/insert")
	public String travelInsert(Model model, HttpSession session) {
		
		String memberId = (String) session.getAttribute("memberId");
		logger.info(memberId);
		if (memberId != null && !memberId.equals("")) {

			List<PlaceVo> placeList = travelService.selectPlaceList();
			model.addAttribute("placeList", placeList);
			return "travel/travelinsert";

		} else {
			// userid가 세션에 없을 때 (로그인하지 않았을 때)
			model.addAttribute("message", "로그인이 필요합니다.");
			return "auth/signin";

		}
		
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
