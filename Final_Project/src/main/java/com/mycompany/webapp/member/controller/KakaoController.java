package com.mycompany.webapp.member.controller;

import java.io.IOException;
import java.net.URLDecoder;
import java.util.HashMap;

import javax.servlet.http.HttpSession;
import javax.validation.constraints.Email;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mycompany.webapp.file.model.FileVo;
import com.mycompany.webapp.file.service.FileService;
import com.mycompany.webapp.member.model.MemberVo;
import com.mycompany.webapp.member.service.IKakaoLoginService;
import com.mycompany.webapp.member.service.KakaoLoginService;
import com.sun.org.apache.bcel.internal.generic.IFGE;

import sun.net.www.content.text.plain;

@Controller
public class KakaoController {
	
	private static final Logger logger = LoggerFactory.getLogger(KakaoController.class);
	
	@Autowired
	public IKakaoLoginService iKakaoS;
	
	
	@Autowired
	private KakaoLoginService kakaoService;
	// 1번 카카오톡에 사용자 코드 받기(jsp의 a태그 href에 경로 있음)
	// 2번 받은 code를 iKakaoS.getAccessToken로 보냄 ###access_Token###로 찍어서 잘 나오면은 다음단계진행
	// 3번 받은 access_Token를 iKakaoS.getUserInfo로 보냄 userInfo받아옴, userInfo에 nickname, email정보가 담겨있음
	
	@Autowired
	private FileService fileService;
	
	
	@RequestMapping(value = "/kakaoLogin", method = RequestMethod.GET)
	public String kakaoLogin(@RequestParam(value = "code", required = false) String code
			, Model model, HttpSession session) throws Throwable {

		// 1번
		System.out.println("code:" + code);
		
		// 2번
		String access_Token = iKakaoS.getAccessToken(code);
		logger.info("###access_Token#### : " + access_Token);
		// 위의 access_Token 받는 걸 확인한 후에 밑에 진행
		
		// 3번
		HashMap<String, Object> userInfo = iKakaoS.getUserInfo(access_Token);
		String email = userInfo.get("email").toString();
		
		
		
		logger.info(email);
		
		MemberVo member = kakaoService.selectKaKao(email);
		if(member != null) {
			session.setAttribute("memberId", member.getMemberId());
			session.setAttribute("memberName", member.getMemberName());
			session.setAttribute("email", member.getEmail());
			session.setAttribute("access_Token", access_Token);
			
			FileVo fileVo = fileService.selectUserImage(member.getMemberId());
			if(fileVo != null && !fileVo.equals("")) {
								
				String fileSavedName = fileVo.getFileSavedName();
				session.setAttribute("fileSavedName", fileSavedName);
			} else {
			session.setAttribute("email", email);
			logger.info(email);
			return "auth/signupkakao";
			}
		}
		return "main";
	}
	
	@RequestMapping(value="/signupKakao", method=RequestMethod.POST)
	public String signupKakao(MemberVo member, HttpSession session) {
		kakaoService.insertKakao(member);
		logger.info(member.toString());
		session.setAttribute("memberId", member.getMemberId());
		session.setAttribute("memberName", member.getMemberName());
		session.setAttribute("email", member.getEmail());
		return "main";
	}
	
	@RequestMapping(value="/login/logout_proc")
    public String logout(HttpSession session)throws IOException {
        if((String)session.getAttribute("access_Token") != ""){
        	kakaoService.getLogout((String)session.getAttribute("access_Token"));
        	session.invalidate();
			 return "redirect:/";
        }else {
            logger.info("카카오 로그인 유저 없음~");
            return "redirect:/";
        }
        
       
    }
}