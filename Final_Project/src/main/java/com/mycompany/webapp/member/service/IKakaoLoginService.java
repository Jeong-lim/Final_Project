package com.mycompany.webapp.member.service;

import java.util.HashMap;

public interface IKakaoLoginService {
	String getAccessToken(String authorize_code) throws Throwable;
	public HashMap<String, Object> getUserInfo(String access_Token) throws Throwable;
	void getLogout(String access_token);
}