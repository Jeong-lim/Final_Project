package com.mycompany.webapp.member.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mycompany.webapp.file.model.FileVo;
import com.mycompany.webapp.file.service.FileService;
import com.mycompany.webapp.member.model.AlarmVo;
import com.mycompany.webapp.member.model.MemberVo;
import com.mycompany.webapp.member.service.MemberService;

@Controller
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	@Autowired
	private MemberService memberService;

	@Autowired
	private FileService fileService;

	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	public String joinForm() {
		return "auth/signup";
	}

	@RequestMapping(value = "/signup", method = RequestMethod.POST)
	public String memberInsert(MemberVo member, HttpSession session) {
		memberService.insertMember(member);
		session.invalidate();
		return "auth/signin";
	}

	@RequestMapping(value = "/signin", method = RequestMethod.GET)
	public String login() {
		logger.info("signin GET 실행");
		return "auth/signin";
	}

	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public String memberPage() {

		return "user/mypage";
	}

	@RequestMapping(value = "/signin", method = RequestMethod.POST)
	public String login(String memberId, String memberPassword, HttpSession session, Model model) throws Exception {
		logger.info("sign in post ?????????????????????");
		MemberVo member = memberService.selectMember(memberId); // 멤버 id가 있는 지 확인
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		if (member != null) {
			String dbPassword = member.getMemberPassword(); // 데이터베이스에 있는 패스워드
			logger.info(dbPassword);
			if (dbPassword == null) {
				model.addAttribute("resultMember", 0);
			} else {
				// 아이디가 있을 때
				if (encoder.matches(memberPassword, dbPassword)) {
					// 비밀번호 일치
					session.setAttribute("memberId", memberId);
					session.setAttribute("memberName", member.getMemberName());
					session.setAttribute("email", member.getEmail());

					FileVo fileVo = fileService.selectUserImage(memberId);
					if (fileVo != null && !fileVo.equals("")) {

						// "".equals(fileVo)

						String fileSavedName = fileVo.getFileSavedName();
						session.setAttribute("fileSavedName", fileSavedName);
					}

					logger.info("login 실행");

					return "redirect:/";
				} else {
					// 비밀번호 불일치
					model.addAttribute("resultMember", 0);
				}
			}
		} else {
			model.addAttribute("message", "회원정보를 찾을 수 없습니다.");
			return "auth/signup";
		}
		session.invalidate();
		return "auth/signin";

	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session, HttpServletRequest request) {
		session.invalidate();
		return "main";
	}

	// 자신의 마이페이지로 이동할 때
	@RequestMapping(value = "/memberPage", method = RequestMethod.GET)
	public String selectMember(HttpSession session, Model model) throws Exception {
		String memberId = (String) session.getAttribute("memberId");
		logger.info(memberId);

		if (memberId != null && !memberId.equals("")) {
			logger.info("회원정보 GET 실행");
			MemberVo member = memberService.selectMember(memberId);
			model.addAttribute("member", member);
			logger.info(member.toString());

			List<MemberVo> userList = memberService.userTravelList(memberId);
			int travelCount = memberService.userTravelCount(memberId);

			model.addAttribute("travelCount", travelCount);
			logger.info(userList.toString());
			model.addAttribute("userList", userList);
			model.addAttribute("followerNum", memberService.countFollower(memberId));
			model.addAttribute("followingNum", memberService.countFollowing(memberId));

			List<MemberVo> followerList = memberService.selectFollowerList(memberId);
			List<MemberVo> followList = memberService.selectFollowList(memberId);
			String msg = "결과가 없습니다.";
			model.addAttribute("followerList", followerList);
			model.addAttribute("followList", followList);
			model.addAttribute("msg", msg);

			return "user/mypage";

		} else {
			// userid가 세션에 없을 때 (로그인하지 않았을 때)
			model.addAttribute("message", "로그인이 필요합니다.");
			return "auth/signin";
		}
	}

	// 다른유저의 마이페이지로 이동할 때
	@RequestMapping(value = "/mypage/{memberId}")
	public String memberPage(HttpServletRequest request, @PathVariable("memberId") String memberId, Model model)
			throws Exception {
		logger.info("실행");
		MemberVo member = memberService.selectMemberInfo(memberId);
		model.addAttribute("member", member);
		List<MemberVo> userList = memberService.userTravelList(memberId);
		int travelCount = memberService.userTravelCount(memberId);

		model.addAttribute("followerNum", memberService.countFollower(memberId));
		model.addAttribute("followingNum", memberService.countFollowing(memberId));
		model.addAttribute("travelCount", travelCount);
		model.addAttribute("userList", userList);
		HttpSession session = request.getSession();
		String sessionId = (String) session.getAttribute("memberId");
		// 팔로우상태 체크
		String status = memberService.checkFollowStatus(memberId, sessionId);
		model.addAttribute("followStatus", status);

		List<MemberVo> followerList = memberService.selectFollowerList(memberId);
		List<MemberVo> followList = memberService.selectFollowList(memberId);
		String msg = "결과가 없습니다.";
		model.addAttribute("followerList", followerList);
		model.addAttribute("followList", followList);
		model.addAttribute("msg", msg);

		return "user/mypage";
	}

	// 팔로우 신청
	@ResponseBody
	@PostMapping("/follow/{member.memberId}/{sessionScope.memberId}")
	public String follow(@PathVariable("member.memberId") String memberId,
			@PathVariable("sessionScope.memberId") String sessionId) throws Exception {
		String alarmCode = "f";
		String followSeq = memberService.searchFollowSeq(memberId, sessionId);
		if (followSeq == null) {
			memberService.requestFollow(memberId, sessionId); // 팔로우 요청
			memberService.insertAlarm(memberId, sessionId, alarmCode); // 알림 전송
		} else if (followSeq != null) {
			String followStatus = memberService.checkFollowStatus(memberId, sessionId);
			System.out.println("followStatus:" + followStatus);
			if (followStatus.equals("U")) {
				memberService.changeFollowStatusN(followSeq);
			}
			memberService.insertAlarm(memberId, sessionId, alarmCode); // 알림 전송
		}
		return "followOk";
	}

	// 사용자검색결과리스트
	@ResponseBody
	@PostMapping("/userSearch")
	public List<MemberVo> userSearch(@RequestParam("value") String keyword) throws Exception {
		List<MemberVo> searchUserList = memberService.searchUser(keyword);
		return searchUserList;
	}

	// 알림 리스트
	@ResponseBody
	@PostMapping("/follow/{sessionScope.memberId}")
	public List<AlarmVo> selectAlarms(@PathVariable("sessionScope.memberId") String sessionId, Model model)
			throws Exception {
		List<AlarmVo> alarmList = memberService.selectAlarms(sessionId);
		return alarmList;

	}

	// 팔로우 허용
	@ResponseBody
	@PostMapping("/acceptFollow/{sessionScope.memberId}")
	public String acceptFollow(@PathVariable("sessionScope.memberId") String sessionId,
			@RequestParam("value") String memberId) throws Exception {
		String followSeq = memberService.searchFollowerSeq(memberId, sessionId);
		memberService.acceptFollow(followSeq);
		return "승낙완료";
	}

	// 팔로우 거절
	@ResponseBody
	@PostMapping("/rejectFollow/{sessionScope.memberId}")
	public String rejectFollow(@PathVariable("sessionScope.memberId") String sessionId,
			@RequestParam("value") String memberId, @RequestParam("value2") String alarmSeq) throws Exception {
		String followSeq = memberService.searchFollowerSeq(memberId, sessionId);
		memberService.changeStatusN(alarmSeq);
		return "거절완료";

	}

	// 알림 삭제
	@ResponseBody
	@PostMapping("/removeAlarm")
	public String removeAlarm(@RequestParam("value") String alarmSeq) throws Exception {
		memberService.changeStatusN(alarmSeq);
		return "삭제완료";
	}

	// 팔로워삭제
	@ResponseBody
	@PostMapping("/deleteBlock")
	public String deleteBlock(@RequestParam("value") String memberId, HttpSession session) throws Exception {
		String sessionId = (String) session.getAttribute("memberId");
		String followSeq = memberService.searchFollowerSeq(memberId, sessionId);
		memberService.rejectFollow(followSeq);
		return "팔로워삭제완료";
	}

	// 언팔로우하기
	@ResponseBody
	@PostMapping("/unFollowBlock")
	public String unFollowBlock(@RequestParam("value") String memberId, HttpSession session) throws Exception {
		String sessionId = (String) session.getAttribute("memberId");
		String followSeq = memberService.searchFollowSeq(memberId, sessionId);
		memberService.unFollow(followSeq);
		return "언팔로우완료";
	}

	// 팔로우신청 취소
	@ResponseBody
	@PostMapping("/cancelFollow")
	public String cancelFollow(@RequestParam("value") String memberId, HttpSession session) {
		String sessionId = (String) session.getAttribute("memberId");
		String followSeq = memberService.searchFollowSeq(memberId, sessionId);
		memberService.rejectFollow(followSeq);
		memberService.cancelFollowAlarm(memberId, sessionId);
		return "신청취소완료";
	}

	@RequestMapping(value = "/mypage/update", method = RequestMethod.GET)
	public String updateMember(HttpSession session, Model model) {
		String memberId = (String) session.getAttribute("memberId");
		logger.info(memberId);
		if (memberId != null && !memberId.equals("")) {
			logger.info("회원정보 GET 실행");
			MemberVo member = memberService.selectMember(memberId);
			model.addAttribute("member", member);

			logger.info(member.toString());

			return "user/mypageupdate";
		} else {
			// userid가 세션에 없을 때 (로그인하지 않았을 때)
			model.addAttribute("message", "로그인이 필요합니다.");
			return "auth/signin";
		}
	}

	@RequestMapping(value = "/mypage/update", method = RequestMethod.POST)
	public String updateMember(MemberVo member, String memberPassword, HttpSession session, Model model) {

		try {
			memberService.updateMember(member);
			model.addAttribute("message", "회원정보가 수정되었습니다.");
			model.addAttribute("member", member);
			session.setAttribute("email", member.getEmail());
			logger.info(member.toString());
			return "user/mypage";
		} catch (Exception e) {
			model.addAttribute("message", e.getMessage());
			e.printStackTrace();
			return "user/mypageupdate";
		}
	}

	@RequestMapping(value = "/mypage/delete", method = RequestMethod.GET)
	public String deleteMember(HttpSession session, Model model) {
		String memberId = (String) session.getAttribute("memberId");
		if (memberId != null && !memberId.equals("")) {
			MemberVo member = memberService.selectMember(memberId);
			model.addAttribute("member", member);
			return "user/deletemember";
		} else {
			// memberid가 세션에 없을 때 (로그인 하지 않았을 때)
			model.addAttribute("message", "로그인이 필요합니다.");
			return "user/deletemember";
		}
	}

	@RequestMapping(value = "/mypage/delete", method = RequestMethod.POST)
	public String deleteMember(String memberPassword, HttpSession session, Model model) {

		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();

		try {
			MemberVo member = new MemberVo();
			member.setMemberId((String) session.getAttribute("memberId"));
			String dbPassword = memberService.getPassword(member.getMemberId());
			if (memberPassword != null && encoder.matches(memberPassword, dbPassword)) {
				member.setMemberPassword(memberPassword);
				memberService.deleteMember(member);
				session.invalidate(); // 삭제되었으면 로그아웃 처리
				return "auth/signin";
			} else {
				model.addAttribute("message", "잘못된 비밀번호입니다.");
				return "user/deletemember";
			}
		} catch (Exception e) {
			model.addAttribute("message", "삭제에 실패하였습니다.");
			e.printStackTrace();
			return "user/deletemember";
		}
	}

	@RequestMapping(value = "/member/idCheck", method = RequestMethod.GET)
	@ResponseBody
	public int idCheck(@RequestParam("memberId") String memberId) {
		return memberService.memberIdCheck(memberId);
	}

	@RequestMapping(value = "/member/idFindCheck", method = RequestMethod.GET)
	@ResponseBody
	public String idFindCheck(@RequestParam("email") String email, @RequestParam("userName") String userName,
			Model model) {
		logger.info(email);
		logger.info(userName);

		String userId = memberService.findUserId(email, userName);

		return userId;
	}

	@GetMapping(value = "/member/idFind")
	public String idFindCheck() {
		return "auth/idcheck";
	}

	@RequestMapping("/travelSlide/{sessionScope.memberId}")
	public String travelSlide(HttpServletRequest request, HttpSession session, Model model) throws Exception {
		String memberId = (String) session.getAttribute("memberId");
		List<MemberVo> userList = memberService.userMainTravelList(memberId);
		model.addAttribute("userList", userList);

		return "common/sliderbanner";
	}
	
	// 마이페이지 체크리스트 
	@RequestMapping("/checkList")
	public String checkListInsert(HttpSession session, @RequestParam("checkItem") String Item, Model model) {
		String memberId = (String) session.getAttribute("memberId");
		logger.info(Item);
		logger.info(memberId);
		
		memberService.insertCheckList(memberId, Item);
		
		return Item;
		
	}
	
	

}