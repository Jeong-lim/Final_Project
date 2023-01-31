package com.mycompany.webapp.place.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.mycompany.webapp.file.model.FileVo;
import com.mycompany.webapp.place.model.PagerVo;
import com.mycompany.webapp.place.model.PlaceVo;

@Mapper
public interface PlaceDao {

	public int count(String category); // 전체 관광지 개수 (중복없이)
	// 전체관광지리스트페이징처리

	public List<PlaceVo> selectPlaceList(Map<Object, Object> map);

	public int countKeyword(Map<String, String> map);

	public List<PlaceVo> KeywordPlaceSearch(Map<Object, Object> map);

	public List<PlaceVo> detailPlaceInfo(String placeName);

	public PlaceVo placeInfo(String placeName);

	public List<PlaceVo> selectPlaceDistance(Map<String, String> map);

}
