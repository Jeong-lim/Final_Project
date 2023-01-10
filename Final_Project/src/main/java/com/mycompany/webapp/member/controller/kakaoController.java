package com.mycompany.webapp.member.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mycompany.webapp.member.service.IKakaoLoginService;

@Controller
public class kakaoController {
	
	@Autowired
	public IKakaoLoginService iKakaoS;
	

	

	// 1번 카카오톡에 사용자 코드 받기(jsp의 a태그 href에 경로 있음)
	// 2번 받은 code를 iKakaoS.getAccessToken로 보냄 ###access_Token###로 찍어서 잘 나오면은 다음단계진행
	// 3번 받은 access_Token를 iKakaoS.getUserInfo로 보냄 userInfo받아옴, userInfo에 nickname, email정보가 담겨있음
	@RequestMapping(value = "/kakaoLogin", method = RequestMethod.GET)
	public ModelAndView kakaoLogin(@RequestParam(value = "code", required = false) String code) throws Throwable {

		// 1번
		System.out.println("code:" + code);
		
		// 2번
		String access_Token = iKakaoS.getAccessToken(code);
		System.out.println("###access_Token#### : " + access_Token);
		// 위의 access_Token 받는 걸 확인한 후에 밑에 진행
		
		// 3번
		HashMap<String, Object> userInfo = iKakaoS.getUserInfo(access_Token);
		System.out.println("###nickname#### : " + userInfo.get("nickname"));
		System.out.println("###email#### : " + userInfo.get("email"));
		
		
		return null;	
		// return에 페이지를 해도 되고, 여기서는 코드가 넘어오는지만 확인할거기 때문에 따로 return 값을 두지는 않았음

	}
}