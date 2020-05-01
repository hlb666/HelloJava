package com.ftf.dao;

import org.apache.ibatis.annotations.Param;

import com.ftf.beans.ErWeiMa;
import com.ftf.beans.User;

public interface UserUpdateMapper {
	
	public void updateUser(@Param("user")User user);
	public ErWeiMa erWeiMa(int id);
	
	

}
