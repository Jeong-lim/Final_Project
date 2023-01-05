package com.mycompany.webapp.member.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.catalina.tribes.MembershipListener;
import org.apache.ibatis.annotations.Delete;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mycompany.webapp.member.model.MemberVo;
import com.mycompany.webapp.member.service.MemberService;

@Controller
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberService memberService;
	
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
		MemberVo member = memberService.selectMember(memberId);
		if(member != null) {
			String dbPassword = member.getMemberPassword(); // 데이터베이스에 있는 패스워드
			logger.info(dbPassword);
				if(dbPassword == null) { 
					model.addAttribute("message", "아이디가 없습니다.");
				} else {
					// 아이디가 있을 때
					if(dbPassword.equals(memberPassword)) {
						// 비밀번호 일치
						session.setAttribute("memberId", memberId);
						session.setAttribute("memberName", member.getMemberName());
						session.setAttribute("email", member.getEmail());
						session.setAttribute("phoneNumber", member.getPhoneNumber());
						session.setAttribute("memberPassword", member.getMemberPassword());
						logger.info("login 실행");
						return "redirect:/";
					} else {
						// 비밀번호 불일치
						model.addAttribute("messgae", "비밀번호가 틀렸습니다.");
					}
				}
		} else {
			model.addAttribute("message", "회원정보를 찾을 수 없습니다.");
		}
		session.invalidate();
		return "auth/signin";
		
	}
	
	@RequestMapping(value="/logout", method=RequestMethod.GET)
	public String logout(HttpSession session, HttpServletRequest request) {
		session.invalidate();
		return "main";
	}
	
	@RequestMapping(value="/mypage/update", method=RequestMethod.GET)
	public String updateMember(HttpSession session, Model model) {
		String memberId = (String)session.getAttribute("memberId");
		if(memberId != null && !memberId.equals("")) {
			MemberVo member = memberService.selectMember(memberId);
			model.addAttribute("member", member);
			model.addAttribute("message", "회원 정보 입니다.");
			return "user/mypageupdate";
		} else {
			// userid가 세션에 없을 때 (로그인하지 않았을 때)
			model.addAttribute("message", "로그인이 필요합니다.");
			return "auth/login";
		}
	}
	
	@RequestMapping(value="/mypage/update", method=RequestMethod.POST)
	public String updateMember(MemberVo member, HttpSession session, Model model) {
		try {
			memberService.updateMember(member);
			model.addAttribute("message", "회원정보가 수정되었습니다.");
			model.addAttribute("member", member);
			session.setAttribute("email", member.getEmail());
			return "user/mypage";
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
			model.addAttribute("message", "로그인하지 않았습니다.");
			return "user/deletemember";
		}
	}
	
	@RequestMapping(value="/mypage/delete", method=RequestMethod.POST)
	public String deleteMember(String memberPassword, HttpSession session, Model model) {
		try {
			MemberVo member = new MemberVo();
			member.setMemberId((String)session.getAttribute("memberId"));
			String dbPassword = memberService.getPassword(member.getMemberId());
			if(memberPassword != null && memberPassword.equals(dbPassword)) {
				member.setMemberPassword(memberPassword);
				memberService.deleteMember(member);
				session.invalidate(); // 삭제되었으면 로그아웃 처리
				return "auth/signin";
			} else {
				model.addAttribute("message", "잘못된 비밀번호입니다.");
				return "user/deletemember";
			}
		} catch (Exception e) {
			model.addAttribute("message", "삭제 실패");
			e.printStackTrace();
			return "user/deletemember";
		}
	}
	
	
	
	
}