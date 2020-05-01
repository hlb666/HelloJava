package com.dao;

import java.util.List;
import java.util.Map;

import com.entity.Zujinxinxi;

public interface ZujinxinxiMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Zujinxinxi record);

    int insertSelective(Zujinxinxi record);

    Zujinxinxi selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Zujinxinxi record);
	
    int updateByPrimaryKey(Zujinxinxi record);
	public Zujinxinxi quchongZujinxinxi(Map<String, Object> chengzuren);
	public List<Zujinxinxi> getAll(Map<String, Object> map);
	public List<Zujinxinxi> getsyzujinxinxi1(Map<String, Object> map);
	public List<Zujinxinxi> getsyzujinxinxi3(Map<String, Object> map);
	public List<Zujinxinxi> getsyzujinxinxi2(Map<String, Object> map);
	public int getCount(Map<String, Object> po);
	public List<Zujinxinxi> getByPage(Map<String, Object> map);
	public List<Zujinxinxi> select(Map<String, Object> map);
//	所有List
}

