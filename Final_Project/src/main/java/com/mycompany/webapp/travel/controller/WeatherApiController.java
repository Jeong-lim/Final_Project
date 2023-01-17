package com.mycompany.webapp.travel.controller;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.mycompany.webapp.member.controller.MemberController;

/*
    @RestController : 기본으로 하위에 있는 메소드들은 모두 @ResponseBody를 가지게 된다.
    @RequestBody : 클라이언트가 요청한 XML/JSON을 자바 객체로 변환해서 전달 받을 수 있다.
    @ResponseBody : 자바 객체를 XML/JSON으로 변환해서 응답 객체의 Body에 실어 전송할 수 있다.
            클라이언트에게 JSON 객체를 받아야 할 경우는 @RequestBody, 자바 객체를 클라이언트에게 JSON으로 전달해야할 경우에는 @ResponseBody 어노테이션을 붙여주면 된다. 
    @ResponseBody를 사용한 경우 View가 아닌 자바 객체를 리턴해주면 된다.
*/

/* 
@ API LIST ~

getUltraSrtNcst 초단기실황조회 
getUltraSrtFcst 초단기예보조회 
getVilageFcst 동네예보조회 
getFcstVersion 예보버전조회
*/
@RestController
@RequestMapping("/api")
public class WeatherApiController {
	
	private static final Logger logger = LoggerFactory.getLogger(WeatherApiController.class);
    
    @GetMapping("/weather")
    @ResponseBody
    public String restApiGetWeather(@RequestParam("do")String lo_do, @RequestParam("si")String lo_si) throws Exception {
        
    	logger.info(lo_do);
    	logger.info(lo_si);
    	
        String url = "http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst"
            + "?serviceKey=eYxy%2BFWb2RXHCKaOnmpTvXqXYqSq2t79Rn9K8Nr0yIJw2%2FjYpABGjQKAdK7WFKA0ov2KsKCIh2cbPyLaNNRXMQ%3D%3D"
            + "&dataType=JSON"            // JSON, XML
            + "&numOfRows=10"             // 페이지 ROWS
            + "&pageNo=1"                 // 페이지 번호
            + "&base_date=20230115"       // 발표일자
            + "&base_time=0800"           // 발표시각
            + "&nx=60"                    // 예보지점 X 좌표
            + "&ny=127";                  // 예보지점 Y 좌표
        
        HashMap<String, Object> resultMap = getDataFromJson(url, "UTF-8", "get", "");
        
        System.out.println("# RESULT : " + resultMap);

        JSONObject jsonObj = new JSONObject();
        
        jsonObj.put("result", resultMap);
        
        return jsonObj.toString();
    }
    
    public HashMap<String, Object> getDataFromJson(String url, String encoding, String type, String jsonStr) throws Exception {
        boolean isPost = false;

        if ("post".equals(type)) {
            isPost = true;
        } else {
            url = "".equals(jsonStr) ? url : url + "?request=" + jsonStr;
        }

        return getStringFromURL(url, encoding, isPost, jsonStr, "application/json");
    }
    
    public HashMap<String, Object> getStringFromURL(String url, String encoding, boolean isPost, String parameter, String contentType) throws Exception {
        URL apiURL = new URL(url);

        HttpURLConnection conn = null;
        BufferedReader br = null;
        BufferedWriter bw = null;

        HashMap<String, Object> resultMap = new HashMap<String, Object>();

        try {
            conn = (HttpURLConnection) apiURL.openConnection();
            conn.setConnectTimeout(5000);
            conn.setReadTimeout(5000);
            conn.setDoOutput(true);

            if (isPost) {
                conn.setRequestMethod("POST");
                conn.setRequestProperty("Content-Type", contentType);
                conn.setRequestProperty("Accept", "*/*");
            } else {
                conn.setRequestMethod("GET");
            }

            conn.connect();

            if (isPost) {
                bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream(), "UTF-8"));
                bw.write(parameter);
                bw.flush();
                bw = null;
            }

            br = new BufferedReader(new InputStreamReader(conn.getInputStream(), encoding));

            String line = null;

            StringBuffer result = new StringBuffer();

            while ((line=br.readLine()) != null) result.append(line);

            ObjectMapper mapper = new ObjectMapper();

            resultMap = mapper.readValue(result.toString(), HashMap.class);
        } catch (Exception e) {
            e.printStackTrace();
            throw new Exception(url + " interface failed" + e.toString());
        } finally {
            if (conn != null) conn.disconnect();
            if (br != null) br.close();
            if (bw != null) bw.close();
        }

        return resultMap;
    }
}