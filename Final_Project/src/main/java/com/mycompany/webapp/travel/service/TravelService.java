package com.mycompany.webapp.travel.service;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.mycompany.webapp.place.model.PagerVo;
import com.mycompany.webapp.place.model.PlaceVo;
import com.mycompany.webapp.travel.dao.TravelDao;

@Service
public class TravelService {
	private static final Logger logger = LoggerFactory.getLogger(TravelService.class);

	@Resource
	private TravelDao travelDao;

	public int countTravel() {
		return travelDao.count();

	}

	public List<PlaceVo> selectPlaceList() { // 전체 관광지 리스트 (중복없이)
		return travelDao.selectPlaceList();
	}
}
