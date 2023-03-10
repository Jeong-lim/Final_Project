package com.mycompany.webapp.travel.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.swing.plaf.synth.SynthSeparatorUI;

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
import com.mycompany.webapp.travel.model.SearchVo;
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
		if (sessionId != null) { // ???????????? ??? ???????????? ????????????
			
			// ??????????????? ??????
			String status = memberService.checkFollowStatus(memberId, sessionId);
			model.addAttribute("follow", status);
			//logger.info(status);

			if (travel != null) {
				model.addAttribute("travelTitle", travel.getTravelTitle());
				model.addAttribute("startDate", travel.getTravelStart());
				model.addAttribute("endDate", travel.getTravelEnd());
				model.addAttribute("writer", travel.getWriter());
				model.addAttribute("viewCnt", travel.getViewCnt());
				model.addAttribute("shareCnt", travel.getShareCnt());
				model.addAttribute("travelPrivacy", travel.getTravelPrivacy());
				model.addAttribute("travelReview", travel.getTravelReview());
				model.addAttribute("originalTravelId", travel.getOriginalTravelId());
				model.addAttribute("originalWriter", travel.getOriginalWriter());
				

				FileVo fileVo = fileService.selectUserImage(memberId);
				if (fileVo != null) {
					String userProfile = fileVo.getFileSavedName();
					model.addAttribute("userProfile", userProfile);
				}

				List<Map<String, String>> detailList = travelService.selectTravelDetail(travelId);
				List<Map<String, String>> detailTravel = travelService.selectTravelPlace(travelId);
				//logger.info(detailList.toString());
				//logger.info(detailTravel.toString());
				model.addAttribute("detailList", detailList);
				model.addAttribute("detailTravel", detailTravel);


			}

		} else {
			model.addAttribute("message", "????????? ???????????? ????????? ??? ????????????.");
			return "auth/signin";
		}

		return "travel/traveldetail";

	}
	
	@ResponseBody
	@PostMapping(value = "/travel/review")
	public String travelReview(Model model, HttpSession session,
			@RequestParam(value = "travelReview", required = false) String travelReview,
			@RequestParam(value = "travelId", required = false) String travelId) {

			
			travelService.travelReview(travelId, travelReview);

			return travelReview;

	}
	
	@RequestMapping(value = "/travel/scrap", method=RequestMethod.GET)
	public String scrapTravel(@RequestParam("travelId") String travelId, @RequestParam("memberId") String memberId,HttpSession session) {	
		
		
		
		logger.info(travelId);
		logger.info(memberId);
		
		travelService.scrapTravel(travelId, memberId);	
		String travelId2=travelService.findLastTravelId2();
		//System.out.println(travelId2);
		
		List<Map<String, String>> travelDetailList = travelService.selectTravelDetailList(travelId);	
		
		List<String> travelDateList = new ArrayList<String>();
		List<String> placeIdList = new ArrayList<String>();
		List<String> memoList = new ArrayList<String>();
		String travelDate;
		String placeId;
		String memo;
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		for(Map<String, String> data : travelDetailList){
			
			travelDate=data.get("TRAVELDATE");
			placeId=data.get("PLACEID");
			memo=data.get("MEMO");
			travelService.scrapTravelDetail(travelId2,travelDate,placeId,memo);

			System.out.println(travelDate);
			System.out.println(placeId);
			System.out.println(memo);
			
		}
		
			String scrapID=travelService.findLastTravelId2();
			String sessionId = (String) session.getAttribute("memberId");
			String memberId1=travelService.findTravelId(travelId);
			String alarmCode=travelId;
			memberService.insertAlarm(memberId1, sessionId, alarmCode); //????????? ?????? ??????
			return "redirect:/travel/"+scrapID+"/"+memberId;

	}
	
	
	
	@RequestMapping(value = "/travel/delete", method=RequestMethod.GET)
	public String deleteTravel(@RequestParam("travelId") String travelId) {	
			travelService.deleteTravelScrap(travelId);
			travelService.deleteTravel(travelId);
			//logger.info(travelId);
			//logger.info("delete");

			return "main";

	}
	
	@RequestMapping(value = "/travel/update/{travelId}/{memberId}", method=RequestMethod.GET)
	public String updateTravel(@PathVariable("travelId") String travelId, @PathVariable("memberId") String memberId, Model model, HttpServletRequest request) {	
		
		HttpSession session = request.getSession();
		String sessionId = (String) session.getAttribute("memberId");
		TravelVo travel = travelService.selectTravel(memberId, travelId);
			//TravelVo travel = travelService.travelListToUpdate(travelId);
			
			model.addAttribute("travelTitle", travel.getTravelTitle());
			model.addAttribute("startDate", travel.getTravelStart());
			model.addAttribute("endDate", travel.getTravelEnd());
			model.addAttribute("travelDate", travel.getTravelDate());
			model.addAttribute("writer", travel.getWriter());
			model.addAttribute("memo", travel.getMemo());
			model.addAttribute("travelPrivacy", travel.getTravelPrivacy());
			model.addAttribute("travelId", travel.getTravelId());
			
			List<PlaceVo> placeList = travelService.selectPlaceList();
			model.addAttribute("placeList", placeList);
			
	
			List<Map<String, String>> detailList = travelService.selectTravelDetail(travelId);
			List<Map<String, String>> detailTravel = travelService.selectTravelPlace(travelId);
			
			//logger.info(detailList.toString());
			//logger.info(detailTravel.toString());
			model.addAttribute("detailList", detailList);
			model.addAttribute("detailTravel", detailTravel);

		
			//travelService.updateTravel(travelId);
			//logger.info(travelId);
			//logger.info("update");

			return "travel/travelupdate";

	}
	
	
	
	@ResponseBody
	@PostMapping(value = "/travel/updateTravel")
	public String updateTravel(Model model, HttpSession session,
			@RequestParam(value = "value", required = false) String travelStart,
			@RequestParam(value = "value2", required = false) String travelEnd,
			@RequestParam(value = "value3", required = false) String travelTitle,
			@RequestParam(value = "value4", required = false) String travelPrivacy,
			@RequestParam(value = "value5", required = false) String travelId) {
			
		
			travelService.updateTravelStatus(travelId);

			String memberId = (String) session.getAttribute("memberId");
			logger.info(travelId);
			logger.info(memberId);
			logger.info(travelTitle);
			System.out.println(travelPrivacy);
			logger.info(travelStart);
			logger.info(travelEnd);
			
			
			travelService.updateTravel(travelId, travelTitle, travelPrivacy, travelStart, travelEnd, memberId);

			return "ok";

	}
	
	@ResponseBody
	@RequestMapping(value="/travel/updateTravelDetail", method=RequestMethod.POST)
	public String updateTravelDetail(Model model, HttpServletRequest request,  @RequestParam String[] placeName) {
			
			System.out.println("--------------------");
			String travelDate=request.getParameter("travelDate");
			String memo=request.getParameter("memo");
			String travelId=request.getParameter("travelId");
			
			System.out.println(Arrays.toString(placeName));
			System.out.println(travelDate);
			System.out.println(memo);
			

			
		for (int i = 0; i < placeName.length; i++) {
			System.out.println(placeName[i]);
			String placeName1=placeName[i];
			TravelVo travelvo=travelService.findPlaceId(placeName1);
			//travelId=travelvo.getTravelId();
			String placeId=travelvo.getPlaceId();
			System.out.println(travelId);
			System.out.println(placeId);
			travelService.updateTravelDetail(travelId, travelDate, placeId, memo);
		}

			return travelId;

	}
	
	 
	@ResponseBody
	@PostMapping(value = "/travel/insertTravel")
	public String insertTravel(Model model, HttpSession session,
			@RequestParam(value = "value", required = false) String travelStart,
			@RequestParam(value = "value2", required = false) String travelEnd,
			@RequestParam(value = "value3", required = false) String travelTitle,
			@RequestParam(value = "value4", required = false) String travelPrivacy) {

			String memberId = (String) session.getAttribute("memberId");
			
			travelService.insertTravel(memberId, travelTitle, travelPrivacy, travelStart, travelEnd);

			return "ok";

	}
	
	@ResponseBody
	@RequestMapping(value="/travel/insertTravelDetail", method=RequestMethod.POST)
	public String insertTravelDetail(Model model, HttpServletRequest request,  @RequestParam String[] placeName) {
			
			String travelDate=request.getParameter("travelDate");
			String memo=request.getParameter("memo");
			
			/*System.out.println(Arrays.toString(placeName));
			System.out.println(travelDate);
			System.out.println(memo);*/
			String travelId=null;

			
		for (int i = 0; i < placeName.length; i++) {
			//System.out.println(placeName[i]);
			String placeName1=placeName[i];
			TravelVo travelvo=travelService.findLastTravelId(placeName1);
			travelId=travelvo.getTravelId();
			String placeId=travelvo.getPlaceId();
			//System.out.println(travelId);
			//System.out.println(placeId);
			travelService.insertTravelDetail(travelId, travelDate, placeId, memo);
		}

			return travelId;

	}

	@RequestMapping("/travel/insert")
	public String travelInsert(Model model, HttpSession session) {
		
		String memberId = (String) session.getAttribute("memberId");
		//logger.info(memberId);
		if (memberId != null && !memberId.equals("")) {

			List<PlaceVo> placeList = travelService.selectPlaceList();
			model.addAttribute("placeList", placeList);
			return "travel/travelinsert";

		} else {
			// userid??? ????????? ?????? ??? (??????????????? ????????? ???)
			model.addAttribute("message", "???????????? ???????????????.");
			return "auth/signin";

		}
		
	}

	// ?????? ?????? ???????????? ????????? ?????? ?????? ??????
	@RequestMapping(value = "/travel/insert/placelist")
	public @ResponseBody List<PlaceVo> travelInsert(@RequestParam("searchType") String searchType,
			@RequestParam("keyword") String keyword, Model model) {
		model.addAttribute("searchType", searchType);
		model.addAttribute("keyword", keyword);
		//logger.info(searchType);
		//logger.info(keyword);
		List<PlaceVo> placeList = travelService.selectTravelListByArea(searchType, keyword);
		model.addAttribute("placeList", placeList);

		return placeList;
	}

	// ?????? ?????? ?????????
	@RequestMapping(value = "/travel/list", method = RequestMethod.GET)
	public String getTravelList(@RequestParam(defaultValue = "1") int pageNo, Model model) {
		// ????????? ????????? ?????? ?????? ??? ???
		int totalRows = travelService.countTravel();
		// ????????? ????????? ?????? pager ?????? ??????
		PagerVo pager = new PagerVo(10, 5, totalRows, pageNo);

		// ?????? ???????????? ?????? ????????????
		List<TravelVo> travelList = travelService.selectTravelList(pager);
		
		
		// JSP?????? ????????? ???????????? ??????
		model.addAttribute("pager", pager);
		model.addAttribute("travelList", travelList);
		logger.info("???????????????");
		return "travel/travellist";
	}

	// ?????? ?????? ???????????? ????????? ??? ??????
	@RequestMapping(value = "/travel/viewCnt/list", method = RequestMethod.GET)
	public String getTravelListByView(@RequestParam(defaultValue = "1") int pageNo, Model model) {

		int totalRows = travelService.countTravel();
		PagerVo pager = new PagerVo(10, 5, totalRows, pageNo);
		List<TravelVo> travelList = travelService.selectTravelListByView(pager);
		model.addAttribute("pager", pager);
		model.addAttribute("travelList", travelList);

		String category = "viewCnt";
		model.addAttribute("category",category);
		logger.info(category);

		logger.info("?????????");
		return "travel/travellist";
	}

	// ?????? ?????? ????????? ?????? ??? ??????
	@RequestMapping(value = "/travel/shareCnt/list", method = RequestMethod.GET)
	public String getTravelListByShare(@RequestParam(defaultValue = "1") int pageNo, Model model) {

		int totalRows = travelService.countTravel();
		PagerVo pager = new PagerVo(10, 5, totalRows, pageNo);
		List<TravelVo> travelList = travelService.selectTravelListByShare(pager);
		model.addAttribute("pager", pager);
		model.addAttribute("travelList", travelList);
		String category = "shareCnt";
		model.addAttribute("category",category);
		logger.info(category);

		logger.info("?????????");
		return "travel/travellist";
	}

	// ?????? ?????? ????????? ?????? ??? ??????
	@RequestMapping(value = "/travel/recent/list", method = RequestMethod.GET)
	public String getTravelListByRecent(@RequestParam(defaultValue = "1") int pageNo, Model model) {

		int totalRows = travelService.countTravel();
		PagerVo pager = new PagerVo(10, 5, totalRows, pageNo);
		List<TravelVo> travelList = travelService.selectTravelListByRecent(pager);
		model.addAttribute("pager", pager);
		model.addAttribute("travelList", travelList);
		String category = "recent";
		model.addAttribute("category",category);
		logger.info(category);

		logger.info("?????????");
		return "travel/travellist";
	}

	// ?????? ?????? ????????? ??????
	@RequestMapping(value = "/travel/search/list", method = RequestMethod.POST)
	public String getTravelListBySearch(HttpServletRequest request,Model model) {
		int pageNo = Integer.parseInt(request.getParameter("page"));
		String searchType=request.getParameter("searchType");
		String keyword=request.getParameter("keyword");
		
		System.out.println(pageNo);
		System.out.println(searchType);
		System.out.println(keyword);
		
		
		int totalRows = travelService.countTravelSearch(searchType, keyword);
		PagerVo pager = new PagerVo(10, 5, totalRows, pageNo);
		int endRowNo = pager.getEndRowNo();
		int startRowNo = pager.getStartRowNo();

		List<TravelVo> travelList = travelService.selectTravelListByKeyword(endRowNo, startRowNo, searchType, keyword);

		model.addAttribute("pager", pager);
		model.addAttribute("travelList", travelList);

		model.addAttribute("searchType", searchType);
		model.addAttribute("keyword", keyword);

		logger.info("???????????????");
		return "travel/travellist";
	}

}
