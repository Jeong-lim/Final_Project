package com.mycompany.webapp.place.service;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.mycompany.webapp.place.dao.PlaceDao;

@Service
public class PlaceService {
	@Resource
	private PlaceDao placeDao;
	
	public int countPlace() {
		return placeDao.count();
		
		
		
		
	}
}
