package com.server;

import java.util.List;

import java.util.Map;

import com.entity.Zufanghetong;

public interface ZufanghetongServer {

  public int add(Zufanghetong po);

  public int update(Zufanghetong po);
  
  
  
  public int delete(int id);

  public List<Zufanghetong> getAll(Map<String,Object> map);
  public List<Zufanghetong> getsyzufanghetong1(Map<String,Object> map);
  public List<Zufanghetong> getsyzufanghetong2(Map<String,Object> map);
  public List<Zufanghetong> getsyzufanghetong3(Map<String,Object> map);
  public Zufanghetong quchongZufanghetong(Map<String, Object> acount);

  public Zufanghetong getById( int id);

  public List<Zufanghetong> getByPage(Map<String, Object> map);

  public int getCount(Map<String,Object> map);

  public List<Zufanghetong> select(Map<String, Object> map);
}
//	所有List
