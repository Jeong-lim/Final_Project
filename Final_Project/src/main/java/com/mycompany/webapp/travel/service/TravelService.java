package com.mycompany.webapp.travel.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.mycompany.webapp.file.model.FileVo;
import com.mycompany.webapp.place.model.PagerVo;
import com.mycompany.webapp.place.model.PlaceVo;
import com.mycompany.webapp.travel.dao.TravelDao;
import com.mycompany.webapp.travel.model.SearchVo;
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
	
	public TravelVo selectLocationInfo(String locationSi) {
		return travelDao.selectLocationInfo(locationSi);
	}

	public int insertTravel(String memberId, String travelTitle, String travelPrivacy, String travelStart, String travelEnd) {
		return travelDao.insertTravel(memberId, travelTitle, travelPrivacy,travelStart,travelEnd);
		
	}

	public int insertTravelDetail(String travelId, String travelDate, String placeId, String memo ) {
		Map<String, String> map = new HashMap<>();
		map.put("travelDate", travelDate);
		map.put("placeId", placeId);
		map.put("memo", memo);
		map.put("travelId", travelId);
		return travelDao.insertTravelDetail(map);
		
	}

	public TravelVo findLastTravelId(String placeName1) {
		return travelDao.findLastTravelId(placeName1);
	}
	
	// travel detail 관련 service 
	
	public TravelVo selectTravel(String memberId, String travelId) {
		Map<String, String> map = new HashMap<>();
		map.put("memberId", memberId);
		map.put("travelId", travelId);
		travelDao.viewCount(travelId);
		return travelDao.selectTravel(map);
	}
	
	public List<Map<String, String>> selectTravelDetail(String travelId) {
		return travelDao.selectTravelDetail(travelId);
	}
	
	public List<Map<String, String>> selectTravelPlace(String travelId) {
		return travelDao.selectTravelPlace(travelId);
	}
	
	public void deleteTravel(String travelId) {
		travelDao.deleteTravel(travelId);
	}

	public TravelVo travelListToUpdate(String travelId) {
		return travelDao.travelListToUpdate(travelId);
	}

	public void updateTravelStatus(String travelId) {
		travelDao.updateTravelStatus(travelId);
		
	}

	public void updateTravel(String travelId, String travelTitle, String travelPrivacy, String travelStart, String travelEnd, String memberId) {
		travelDao.updateTravel(travelId, travelTitle, travelPrivacy, travelStart, travelEnd,memberId);
		
	}

	public void updateTravelDetail(String travelId, String travelDate, String placeId, String memo) {
		travelDao.updateTravelDetail(travelId, travelDate, placeId, memo);
		
	}

	public TravelVo findPlaceId(String placeName1) {
		return travelDao.findPlaceId(placeName1);
	}

	public void travelReview(String travelId, String travelReview) {
		 travelDao.travelReview(travelId,travelReview);
		
	}

	public void scrapTravel(String travelId, String memberId) {
		travelDao.scrapTravel(travelId, memberId);
		
	}

	

	public String findLastTravelId2() {
		return travelDao.findLastTravelId2();
	}

	public List<Map<String, String>> selectTravelDetailList(String travelId) {
		return travelDao.selectTravelDetailList(travelId);
	}

	public void scrapTravelDetail(String travelId2, String travelDate, String placeId, String memo) {
		travelDao.scrapTravelDetail(travelId2, travelDate, placeId, memo);
		
	}
	
	public String findTravelId(String travelId) {
		return travelDao.findTravelId(travelId);
	}

	public void deleteTravelScrap(String travelId) {
		travelDao.deleteTravelScrap(travelId);
		
	}

}
