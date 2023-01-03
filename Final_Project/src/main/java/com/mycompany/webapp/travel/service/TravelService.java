package com.mycompany.webapp.travel.service;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import com.mycompany.webapp.travel.dao.TravelDao;

@Service
public class TravelService {
	private static final Logger logger = LoggerFactory.getLogger(TravelService.class);

	@Resource
	private TravelDao travelDao;

	public int countTravel() {
		return travelDao.count();

	}
}
