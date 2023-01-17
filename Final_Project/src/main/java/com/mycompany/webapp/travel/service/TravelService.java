package com.mycompany.webapp.travel.service;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.mycompany.webapp.file.model.FileVo;
import com.mycompany.webapp.place.model.PagerVo;
import com.mycompany.webapp.place.model.PlaceVo;
import com.mycompany.webapp.travel.dao.TravelDao;
import com.mycompany.webapp.travel.model.Search;
import com.mycompany.webapp.travel.model.TravelVo;

@Service
public class TravelService {
	private static final Logger logger = LoggerFactory.getLogger(TravelService.class);

	@Resource
	private TravelDao travelDao;

	public int countTravel() {
		return travelDao.countTravel();

	}
	
	public List<PlaceVo> selectPlaceList(){  //전체 관광지 리스트 
		return travelDao.selectPlaceList();
	}
	
	public List<TravelVo> selectTravelList(PagerVo pager){  //전체 여행일정 리스트
		return travelDao.selectTravelList(pager);
	}

	public List<TravelVo> selectTravelListByView(PagerVo pager) {
		return travelDao.selectTravelListByView(pager);
	}

	public List<TravelVo> selectTravelListByShare(PagerVo pager) {
		return travelDao.selectTravelListByShare(pager);
	}

	public List<TravelVo> selectTravelListByRecent(PagerVo pager) {
		return travelDao.selectTravelListByRecent(pager);
	}

	
	public int countTravelSearch(String searchType, String keyword) {
		return travelDao.countTravelSearch(searchType,keyword);
	}

	public List<TravelVo> selectTravelListByKeyword(int endRowNo, int startRowNo, String searchType, String keyword) {
		return travelDao.selectTravelListByKeyword(endRowNo, startRowNo,searchType, keyword);
	}

	public List<PlaceVo> selectTravelListByArea(String searchType, String keyword) {
		
		return travelDao.selectTravelListByArea(searchType, keyword);
	}
	
	


	

	


		
	

}
