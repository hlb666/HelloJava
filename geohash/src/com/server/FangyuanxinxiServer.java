package com.server;

import java.util.List;

import java.util.Map;

import com.entity.Fangyuanxinxi;

public interface FangyuanxinxiServer {

  public int add(Fangyuanxinxi po);

  public int update(Fangyuanxinxi po);
  
  
  
  public int delete(int id);

  public List<Fangyuanxinxi> getAll(Map<String,Object> map);
  public List<Fangyuanxinxi> getsyfangyuanxinxi1(Map<String,Object> map);
  public List<Fangyuanxinxi> getsyfangyuanxinxi2(Map<String,Object> map);
  public List<Fangyuanxinxi> getsyfangyuanxinxi3(Map<String,Object> map);
  public Fangyuanxinxi quchongFangyuanxinxi(Map<String, Object> acount);

  public Fangyuanxinxi getById( int id);

  public List<Fangyuanxinxi> getByPage(Map<String, Object> map);

  public int getCount(Map<String,Object> map);

  public List<Fangyuanxinxi> select(Map<String, Object> map);
  
  public List<Fangyuanxinxi> selectCode();
}
//	所有List
