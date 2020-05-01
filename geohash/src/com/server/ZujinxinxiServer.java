package com.server;

import java.util.List;

import java.util.Map;

import com.entity.Zujinxinxi;

public interface ZujinxinxiServer {

  public int add(Zujinxinxi po);

  public int update(Zujinxinxi po);
  
  
  
  public int delete(int id);

  public List<Zujinxinxi> getAll(Map<String,Object> map);
  public List<Zujinxinxi> getsyzujinxinxi1(Map<String,Object> map);
  public List<Zujinxinxi> getsyzujinxinxi2(Map<String,Object> map);
  public List<Zujinxinxi> getsyzujinxinxi3(Map<String,Object> map);
  public Zujinxinxi quchongZujinxinxi(Map<String, Object> acount);

  public Zujinxinxi getById( int id);

  public List<Zujinxinxi> getByPage(Map<String, Object> map);

  public int getCount(Map<String,Object> map);

  public List<Zujinxinxi> select(Map<String, Object> map);
}
//	所有List
