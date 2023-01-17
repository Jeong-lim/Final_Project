package com.mycompany.webapp.travel.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.mycompany.webapp.file.model.FileVo;
import com.mycompany.webapp.place.model.PagerVo;
import com.mycompany.webapp.place.model.PlaceVo;
import com.mycompany.webapp.travel.model.Search;
import com.mycompany.webapp.travel.model.TravelVo;

@Mapper
public interface TravelDao {
	
	public int countTravel();
	
	public List<PlaceVo> selectPlaceList();
	
	//public List<TravelVo> selectTravelList(); //글 목록
	
	public List<TravelVo> selectTravelList(PagerVo pager); //페이징처리 글 목록

	public List<TravelVo> selectTravelListByView(PagerVo pager); //조회수 순 리스트

	public List<TravelVo> selectTravelListByShare(PagerVo pager); //공유수 순 리스트

	public List<TravelVo> selectTravelListByRecent(PagerVo pager); //최신순 리스트
	
	public int countTravelSearch(@Param("searchType")String searchType, @Param("keyword")String keyword);

	public List<TravelVo> selectTravelListByKeyword(@Param("endRowNo")int endRowNo, @Param("startRowNo")int startRowNo, @Param("searchType")String searchType, @Param("keyword")String keyword); //검색 리스트

	public List<PlaceVo> selectTravelListByArea(@Param("searchType")String searchType, @Param("keyword")String keyword); //모달 장소리스트

	
	// weather dao
	public TravelVo selectLocationInfo(String locationSi);
	


	
	
	
	


}
