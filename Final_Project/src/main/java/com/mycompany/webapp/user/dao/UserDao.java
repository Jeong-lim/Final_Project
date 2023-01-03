package com.mycompany.webapp.user.dao;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserDao {
	
	public int count();

}
