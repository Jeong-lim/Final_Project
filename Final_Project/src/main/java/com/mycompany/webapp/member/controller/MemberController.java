package com.mycompany.webapp.member.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycompany.webapp.file.model.FileVo;
import com.mycompany.webapp.file.service.FileService;
import com.mycompany.webapp.member.model.MemberVo;
import com.mycompany.webapp.member.service.MemberService;

@Controller
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private FileService fileService;
	
	@RequestMapping(value = "/signup", method=RequestMethod.GET)
	public String joinForm() {
		return "auth/signup";
	}
	
	@RequestMapping(value = "/signup", method=RequestMethod.POST)
	public String memberInsert(MemberVo member, HttpSession session) {
		memberService.insertMember(member);
		session.invalidate();
		return "auth/signin";
	}
	
	@RequestMapping(value = "/signin", method=RequestMethod.GET)
	public String login() {
		logger.info("signin GET 실행");
		return "auth/signin";
	}
	
	@RequestMapping(value = "/mypage", method=RequestMethod.GET)
	public String memberPage() {
		
		return "user/mypage";
	}
	
	
	
	
	@RequestMapping(value="/signin", method=RequestMethod.POST)
	public String login(String memberId, String memberPassword, HttpSession session, Model model) {
		
		MemberVo member = memberService.selectMember(memberId); // 멤버 id가 있는 지 확인
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		if(member != null) {
			String dbPassword = member.getMemberPassword(); // 데이터베이스에 있는 패스워드
			logger.info(dbPassword);
				if(dbPassword == null) {
					model.addAttribute("resultMember", 0);
				} else {
					// 아이디가 있을 때
					if(encoder.matches(memberPassword, dbPassword)) {
						// 비밀번호 일치
						session.setAttribute("memberId", memberId);
						session.setAttribute("memberName", member.getMemberName());
						session.setAttribute("email", member.getEmail());
						
						FileVo fileVo = fileService.selectUserImage(memberId);
						if(fileVo != null && !fileVo.equals("")) {
							
							//"".equals(fileVo)
							
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
	
	@RequestMapping(value="/logout", method=RequestMethod.GET)
	public String logout(HttpSession session, HttpServletRequest request) {
		session.invalidate();
		return "main";
	}
	

	@RequestMapping(value="/memberPage", method=RequestMethod.GET)
	public String selectMember(HttpSession session, Model model) throws Exception {
		String memberId = (String)session.getAttribute("memberId");
		logger.info(memberId);
		
		if(memberId != null && !memberId.equals("")) {
			logger.info("회원정보 GET 실행");
			MemberVo member = memberService.selectMember(memberId);
			model.addAttribute("member", member);
			logger.info(member.toString());
			
			List<MemberVo> userList = memberService.userTravelList(memberId);
			int travelCount = memberService.userTravelCount(memberId);
			
			model.addAttribute("travelCount", travelCount);
			logger.info(userList.toString());
			model.addAttribute("userList", userList);
			model.addAttribute("followerNum",memberService.countFollower(memberId));
			model.addAttribute("followingNum",memberService.countFollowing(memberId));
			
			return "user/mypage";
			
		} else {
			// userid가 세션에 없을 때 (로그인하지 않았을 때)
			model.addAttribute("message", "로그인이 필요합니다.");
			return "auth/signin";
		}
	}
	
	@RequestMapping(value="/mypage/{memberId}")
	public String memberPage(@PathVariable("memberId")String memberId,Model model)throws Exception {
		MemberVo member=memberService.selectMemberInfo(memberId);
		model.addAttribute("member",member);
		
		List<MemberVo> userList=memberService.userTravelList(memberId);
		int travelCount=memberService.userTravelCount(memberId);
		model.addAttribute("followerNum",memberService.countFollower(memberId));
		model.addAttribute("followingNum",memberService.countFollowing(memberId));
		model.addAttribute("travelCount",travelCount);
		model.addAttribute("userList",userList);
		
		
		return "user/mypage";
	}
	
	
	
		
	

	@RequestMapping(value="/mypage/update", method=RequestMethod.GET)
	public String updateMember(HttpSession session, Model model) {
		String memberId = (String)session.getAttribute("memberId");
		logger.info(memberId);
		if(memberId != null && !memberId.equals("")) {
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
	
	@RequestMapping(value="/mypage/update", method=RequestMethod.POST)
	public String updateMember(MemberVo member, String memberPassword, HttpSession session, Model model) {
		
		try {
			memberService.updateMember(member);
			model.addAttribute("message", "회원정보가 수정되었습니다.");
			model.addAttribute("member", member);
			session.setAttribute("email", member.getEmail());
			logger.info(member.toString());
			return "user/mypageupdate";
		} catch (Exception e) {
			model.addAttribute("message", e.getMessage());
			e.printStackTrace();
			return "user/mypageupdate";
		}
	}
	
	@RequestMapping(value="/mypage/delete", method=RequestMethod.GET)
	public String deleteMember(HttpSession session, Model model) {
		String memberId = (String)session.getAttribute("memberId");
		if(memberId != null && !memberId.equals("")) {
			MemberVo member = memberService.selectMember(memberId);
			model.addAttribute("member", member);
			return "user/deletemember";
		} else {
			// memberid가 세션에 없을 때 (로그인 하지 않았을 때)
			model.addAttribute("message", "로그인이 필요합니다.");
			return "user/deletemember";
		}
	}
	
	@RequestMapping(value="/mypage/delete", method=RequestMethod.POST)
	public String deleteMember(String memberPassword, HttpSession session, Model model) {
		
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		
		try {
			MemberVo member = new MemberVo();
			member.setMemberId((String)session.getAttribute("memberId"));
			String dbPassword = memberService.getPassword(member.getMemberId());
			if(memberPassword != null && encoder.matches(memberPassword, dbPassword)) {
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
	
	@RequestMapping(value="/member/idCheck", method = RequestMethod.GET)
	@ResponseBody
	public int idCheck(@RequestParam("memberId") String memberId) {
		return memberService.memberIdCheck(memberId);
	}
	

	
	
	
}