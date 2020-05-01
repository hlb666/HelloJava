package com.dao;

import java.util.List;
import java.util.Map;

import com.entity.Zufanghetong;

public interface ZufanghetongMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Zufanghetong record);

    int insertSelective(Zufanghetong record);

    Zufanghetong selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Zufanghetong record);
	
    int updateByPrimaryKey(Zufanghetong record);
	public Zufanghetong quchongZufanghetong(Map<String, Object> chengzuren);
	public List<Zufanghetong> getAll(Map<String, Object> map);
	public List<Zufanghetong> getsyzufanghetong1(Map<String, Object> map);
	public List<Zufanghetong> getsyzufanghetong3(Map<String, Object> map);
	public List<Zufanghetong> getsyzufanghetong2(Map<String, Object> map);
	public int getCount(Map<String, Object> po);
	public List<Zufanghetong> getByPage(Map<String, Object> map);
	public List<Zufanghetong> select(Map<String, Object> map);
//	所有List
}

