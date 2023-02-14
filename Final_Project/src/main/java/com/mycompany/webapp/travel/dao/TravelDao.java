package com.mycompany.webapp.travel.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.mycompany.webapp.file.model.FileVo;
import com.mycompany.webapp.place.model.PagerVo;
import com.mycompany.webapp.place.model.PlaceVo;
import com.mycompany.webapp.travel.model.SearchVo;
import com.mycompany.webapp.travel.model.TravelVo;

@Mapper
public interface TravelDao {
	
	public int countTravel();
	
	public List<PlaceVo> selectPlaceList();
	
	public List<TravelVo> selectTravelList(PagerVo pager); //페이징처리 글 목록

	public List<TravelVo> selectTravelListByView(PagerVo pager); //조회수 순 리스트

	public List<TravelVo> selectTravelListByShare(PagerVo pager); //공유수 순 리스트

	public List<TravelVo> selectTravelListByRecent(PagerVo pager); //최신순 리스트
	
	public int countTravelSearch(@Param("searchType")String searchType, @Param("keyword")String keyword);

	public List<TravelVo> selectTravelListByKeyword(@Param("endRowNo")int endRowNo, @Param("startRowNo")int startRowNo, @Param("searchType")String searchType, @Param("keyword")String keyword); //검색 리스트

	public List<PlaceVo> selectTravelListByArea(@Param("searchType")String searchType, @Param("keyword")String keyword); //모달 장소리스트
	
	public int insertTravel(@Param("memberId")String memberId, @Param("travelTitle")String travelTitle, @Param("travelPrivacy")String travelPrivacy, @Param("travelStart")String travelStart, @Param("travelEnd")String travelEnd);

	public int insertTravelDetail(Map<String,String> map);

	public TravelVo findLastTravelId(@Param("placeName1")String placeName1);
	
	public void deleteTravel(@Param("travelId") String travelId);
	
	// travel detail 관련 dao

	public TravelVo selectTravel(Map<String, String> map);

	public List<Map<String, String>> selectTravelDetail(String travelId);

	public List<Map<String, String>> selectTravelPlace(String travelId);
	
	public void viewCount(String travelId);

	// weather dao
	public TravelVo selectLocationInfo(String locationSi);

	public TravelVo travelListToUpdate(String travelId);
	
	//update travel

	public void updateTravelStatus(@Param("travelId")String travelId);

	public void updateTravel(@Param("travelId")String travelId, @Param("travelTitle")String travelTitle, @Param("travelPrivacy")String travelPrivacy, @Param("travelStart")String travelStart, @Param("travelEnd")String travelEnd, @Param("memberId")String memberId);

	public void updateTravelDetail(@Param("travelId")String travelId, @Param("travelDate")String travelDate, @Param("placeId")String placeId, @Param("memo")String memo);

	public TravelVo findPlaceId(String placeName1);

	public void travelReview(@Param("travelId")String travelId, @Param("travelReview")String travelReview);

	public void scrapTravel(@Param("travelId")String travelId, @Param("memberId")String memberId);

	

	public String findLastTravelId2();

	public List<Map<String, String>> selectTravelDetailList(@Param("travelId")String travelId);

	public void scrapTravelDetail(@Param("travelId2")String travelId2, @Param("travelDate")String travelDate, @Param("placeId")String placeId, @Param("memo")String memo);


	public String findTravelId(@Param("travelId")String travelId); //여행 오리지날 작성자 찾기

	public void deleteTravelScrap(@Param("travelId")String travelId);
	

	

	
	


	
	
	
	


}
