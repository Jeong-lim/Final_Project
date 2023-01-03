package com.mycompany.webapp.user.dao;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import com.mycompany.webapp.user.model.UserVo;

@Mapper
public interface UserDao {
	public List<UserVo> selectAllUsers();
	public UserVo selectUser(String userId);
	public void insertUser(UserVo user);
	public void updateUser(UserVo user);
	public void deleteUser(UserVo user);
	public String getPassword(String userId);
}
