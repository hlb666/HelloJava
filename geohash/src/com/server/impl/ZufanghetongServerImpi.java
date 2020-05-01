package com.server.impl;

import java.util.List;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dao.ZufanghetongMapper;
import com.entity.Zufanghetong;
import com.server.ZufanghetongServer;
@Service
public class ZufanghetongServerImpi implements ZufanghetongServer {
   @Resource
   private ZufanghetongMapper gdao;
	@Override
	public int add(Zufanghetong po) {
		return gdao.insert(po);
	}

	@Override
	public int update(Zufanghetong po) {
		return gdao.updateByPrimaryKeySelective(po);
	}

	
	
	@Override
	public int delete(int id) {
		return gdao.deleteByPrimaryKey(id);
	}

	@Override
	public List<Zufanghetong> getAll(Map<String, Object> map) {
		return gdao.getAll(map);
	}
	
	public List<Zufanghetong> getsyzufanghetong1(Map<String, Object> map) {
		return gdao.getsyzufanghetong1(map);
	}
	public List<Zufanghetong> getsyzufanghetong2(Map<String, Object> map) {
		return gdao.getsyzufanghetong2(map);
	}
	public List<Zufanghetong> getsyzufanghetong3(Map<String, Object> map) {
		return gdao.getsyzufanghetong3(map);
	}
	
	@Override
	public Zufanghetong quchongZufanghetong(Map<String, Object> account) {
		return gdao.quchongZufanghetong(account);
	}

	@Override
	public List<Zufanghetong> getByPage(Map<String, Object> map) {
		return gdao.getByPage(map);
	}

	@Override
	public int getCount(Map<String, Object> map) {
		return gdao.getCount(map);
	}

	@Override
	public List<Zufanghetong> select(Map<String, Object> map) {
		return gdao.select(map);
	}

	@Override
	public Zufanghetong getById(int id) {
		return gdao.selectByPrimaryKey(id);
	}

}

