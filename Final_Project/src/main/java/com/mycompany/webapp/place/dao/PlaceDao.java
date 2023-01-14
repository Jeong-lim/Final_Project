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
	
	public int count(String category); //전체 관광지 개수 (중복없이)
	 //전체관광지리스트페이징처리
	public List<PlaceVo> selectPlaceList(@Param("category")String category, @Param("endRowNo")int endRowNo,@Param("startRowNo")int startRowNo);
	
	public int countKeyword(@Param("key")String key,@Param("keyword")String keyword);
	
	public List<PlaceVo> KeywordPlaceSearch(@Param("key")String key, @Param("keyword")String keyword,@Param("endRowNo")int endRowNo,@Param("startRowNo")int startRowNo);
	
	public List<PlaceVo> detailPlaceInfo(@Param ("placeName")String placeName);

}
