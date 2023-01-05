package com.mycompany.webapp.travel.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.webapp.place.model.PagerVo;
import com.mycompany.webapp.place.model.PlaceVo;

@Mapper
public interface TravelDao {
	
	public int count();
	public List<PlaceVo> selectPlaceList();  //전체관광지리스트페이징처리

}
