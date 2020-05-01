package com.dao;

import java.util.List;
import java.util.Map;

import com.entity.Zufangjilu;

public interface ZufangjiluMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Zufangjilu record);

    int insertSelective(Zufangjilu record);

    Zufangjilu selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Zufangjilu record);
	int updateByPrimaryKeySelectivelb(Zufangjilu record);
    int updateByPrimaryKey(Zufangjilu record);
	public Zufangjilu quchongZufangjilu(Map<String, Object> chengzuren);
	public List<Zufangjilu> getAll(Map<String, Object> map);
	public List<Zufangjilu> getsyzufangjilu1(Map<String, Object> map);
	public List<Zufangjilu> getsyzufangjilu3(Map<String, Object> map);
	public List<Zufangjilu> getsyzufangjilu2(Map<String, Object> map);
	public int getCount(Map<String, Object> po);
	public List<Zufangjilu> getByPage(Map<String, Object> map);
	public List<Zufangjilu> select(Map<String, Object> map);
//	所有List
}

