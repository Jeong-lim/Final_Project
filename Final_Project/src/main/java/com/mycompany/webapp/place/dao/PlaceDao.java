package com.mycompany.webapp.place.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.webapp.place.model.PagerVo;
import com.mycompany.webapp.place.model.PlaceVo;

@Mapper
public interface PlaceDao {
	
	public int count(); //전체 관광지 개수 (중복없이)
	public List<PlaceVo> selectPlaceList(PagerVo pager);  //전체관광지리스트페이징처리
	public int categoryCount(); //카테고리별 관광지 개수(중복없이)
	public List<PlaceVo> selectPlaceListByCategory(PagerVo pager); //카테고리별 관광지 리스트 페이징 처리
	

}
