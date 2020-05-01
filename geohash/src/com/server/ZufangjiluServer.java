package com.server;

import java.util.List;

import java.util.Map;

import com.entity.Zufangjilu;

public interface ZufangjiluServer {

  public int add(Zufangjilu po);

  public int update(Zufangjilu po);
  
  public int updatelb(Zufangjilu po);
  
  public int delete(int id);

  public List<Zufangjilu> getAll(Map<String,Object> map);
  public List<Zufangjilu> getsyzufangjilu1(Map<String,Object> map);
  public List<Zufangjilu> getsyzufangjilu2(Map<String,Object> map);
  public List<Zufangjilu> getsyzufangjilu3(Map<String,Object> map);
  public Zufangjilu quchongZufangjilu(Map<String, Object> acount);

  public Zufangjilu getById( int id);

  public List<Zufangjilu> getByPage(Map<String, Object> map);

  public int getCount(Map<String,Object> map);

  public List<Zufangjilu> select(Map<String, Object> map);
}
//	所有List
