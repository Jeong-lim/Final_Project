package com.mycompany.webapp.place.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.annotations.Param;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import com.mycompany.webapp.place.dao.PlaceDao;
import com.mycompany.webapp.place.model.PagerVo;
import com.mycompany.webapp.place.model.PlaceVo;

@Service
public class PlaceService {
	private static final Logger logger = LoggerFactory.getLogger(PlaceService.class);

	@Resource
	private PlaceDao placeDao;

	public int countPlace(String category) { // 관광지 총 개수 (중복없이)
		return placeDao.count(category);
	}

	
	public List<PlaceVo> selectPlaceList(String category, int endRowNo, int startRowNo){
		return placeDao.selectPlaceList(category, endRowNo, startRowNo);
	}
	
	public int countKeyword(String key,String keyword) {
		return placeDao.countKeyword(key, keyword);
	}

	public List<PlaceVo> KeyworePlaceSearch(String key, String keyword, int endRowNo, int startRowNo){
		return placeDao.KeyworePlaceSearch(key, keyword, endRowNo, startRowNo);
	}

	
	

		
		
}
