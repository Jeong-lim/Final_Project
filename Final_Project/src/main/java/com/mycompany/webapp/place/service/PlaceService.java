package com.mycompany.webapp.place.service;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import com.mycompany.webapp.place.dao.PlaceDao;
import com.mycompany.webapp.place.model.PagerVo;
import com.mycompany.webapp.place.model.PlaceVo;

@Service
public class PlaceService {
	private static final Logger logger = LoggerFactory.getLogger(PlaceService.class);

	@Resource
	private PlaceDao placeDao;

	public int countPlace() { // 관광지 총 개수 (중복없이)
		return placeDao.count();
	}

	
	public List<PlaceVo> selectPlaceList(PagerVo pager){  //전체 관광지 리스트 (중복없이)
		return placeDao.selectPlaceList(pager);
	}
	
	

		
		
}
