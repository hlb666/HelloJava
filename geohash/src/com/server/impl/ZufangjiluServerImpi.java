package com.server.impl;

import java.util.List;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dao.ZufangjiluMapper;
import com.entity.Zufangjilu;
import com.server.ZufangjiluServer;
@Service
public class ZufangjiluServerImpi implements ZufangjiluServer {
   @Resource
   private ZufangjiluMapper gdao;
	@Override
	public int add(Zufangjilu po) {
		return gdao.insert(po);
	}

	@Override
	public int update(Zufangjilu po) {
		return gdao.updateByPrimaryKeySelective(po);
	}

	@Override
	public int updatelb(Zufangjilu po) {
		return gdao.updateByPrimaryKeySelectivelb(po);
	}
	
	@Override
	public int delete(int id) {
		return gdao.deleteByPrimaryKey(id);
	}

	@Override
	public List<Zufangjilu> getAll(Map<String, Object> map) {
		return gdao.getAll(map);
	}
	
	public List<Zufangjilu> getsyzufangjilu1(Map<String, Object> map) {
		return gdao.getsyzufangjilu1(map);
	}
	public List<Zufangjilu> getsyzufangjilu2(Map<String, Object> map) {
		return gdao.getsyzufangjilu2(map);
	}
	public List<Zufangjilu> getsyzufangjilu3(Map<String, Object> map) {
		return gdao.getsyzufangjilu3(map);
	}
	
	@Override
	public Zufangjilu quchongZufangjilu(Map<String, Object> account) {
		return gdao.quchongZufangjilu(account);
	}

	@Override
	public List<Zufangjilu> getByPage(Map<String, Object> map) {
		return gdao.getByPage(map);
	}

	@Override
	public int getCount(Map<String, Object> map) {
		return gdao.getCount(map);
	}

	@Override
	public List<Zufangjilu> select(Map<String, Object> map) {
		return gdao.select(map);
	}

	@Override
	public Zufangjilu getById(int id) {
		return gdao.selectByPrimaryKey(id);
	}

}

