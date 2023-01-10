package com.mycompany.webapp.travel.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.webapp.place.model.PagerVo;
import com.mycompany.webapp.place.model.PlaceVo;
import com.mycompany.webapp.travel.model.TravelVo;

@Mapper
public interface TravelDao {
	
	public int countTravel();
	
	public List<PlaceVo> selectPlaceList();

	public List<PlaceVo> selectPlaceListByArea(String gugun1);
	
	//public List<TravelVo> selectTravelList(); //글 목록
	
	public List<TravelVo> selectTravelList(PagerVo pager); //페이징처리 글 목록

	public List<TravelVo> selectTravelListByView(PagerVo pager); //조회수 순 리스트

	public List<TravelVo> selectTravelListByShare(PagerVo pager); //공유수 순 리스트

	public List<TravelVo> selectTravelListByRecent(PagerVo pager); //최신순 리스트

	


	
	
	
	


}
