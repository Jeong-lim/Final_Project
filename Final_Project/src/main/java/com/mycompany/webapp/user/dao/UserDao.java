package com.mycompany.webapp.user.dao;
import org.apache.ibatis.annotations.Mapper;

<<<<<<< HEAD
import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import com.mycompany.webapp.user.model.UserVo;
=======
@Mapper
public interface UserDao {
	
	public int count();
>>>>>>> branch 'master' of https://github.com/Jeong-lim/Final_Project.git

@Mapper
public interface UserDao {
	public List<UserVo> selectAllUsers();
	public UserVo selectUser(String userId);
	public void insertUser(UserVo user);
	public void updateUser(UserVo user);
	public void deleteUser(UserVo user);
	public String getPassword(String userId);
}
