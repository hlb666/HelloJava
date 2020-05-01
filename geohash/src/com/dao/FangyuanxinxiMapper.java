package com.dao;

import java.util.List;
import java.util.Map;

import com.entity.Fangyuanxinxi;

public interface FangyuanxinxiMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Fangyuanxinxi record);

    int insertSelective(Fangyuanxinxi record);

    Fangyuanxinxi selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Fangyuanxinxi record);
	
    int updateByPrimaryKey(Fangyuanxinxi record);
	public Fangyuanxinxi quchongFangyuanxinxi(Map<String, Object> faburen);
	public List<Fangyuanxinxi> getAll(Map<String, Object> map);
	public List<Fangyuanxinxi> getsyfangyuanxinxi1(Map<String, Object> map);
	public List<Fangyuanxinxi> getsyfangyuanxinxi3(Map<String, Object> map);
	public List<Fangyuanxinxi> getsyfangyuanxinxi2(Map<String, Object> map);
	public int getCount(Map<String, Object> po);
	public List<Fangyuanxinxi> getByPage(Map<String, Object> map);
	public List<Fangyuanxinxi> select(Map<String, Object> map);
	public List<Fangyuanxinxi> selectCode();
//	所有List
}

