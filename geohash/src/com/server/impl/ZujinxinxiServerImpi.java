package com.server.impl;

import java.util.List;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dao.ZujinxinxiMapper;
import com.entity.Zujinxinxi;
import com.server.ZujinxinxiServer;
@Service
public class ZujinxinxiServerImpi implements ZujinxinxiServer {
   @Resource
   private ZujinxinxiMapper gdao;
	@Override
	public int add(Zujinxinxi po) {
		return gdao.insert(po);
	}

	@Override
	public int update(Zujinxinxi po) {
		return gdao.updateByPrimaryKeySelective(po);
	}

	
	
	@Override
	public int delete(int id) {
		return gdao.deleteByPrimaryKey(id);
	}

	@Override
	public List<Zujinxinxi> getAll(Map<String, Object> map) {
		return gdao.getAll(map);
	}
	
	public List<Zujinxinxi> getsyzujinxinxi1(Map<String, Object> map) {
		return gdao.getsyzujinxinxi1(map);
	}
	public List<Zujinxinxi> getsyzujinxinxi2(Map<String, Object> map) {
		return gdao.getsyzujinxinxi2(map);
	}
	public List<Zujinxinxi> getsyzujinxinxi3(Map<String, Object> map) {
		return gdao.getsyzujinxinxi3(map);
	}
	
	@Override
	public Zujinxinxi quchongZujinxinxi(Map<String, Object> account) {
		return gdao.quchongZujinxinxi(account);
	}

	@Override
	public List<Zujinxinxi> getByPage(Map<String, Object> map) {
		return gdao.getByPage(map);
	}

	@Override
	public int getCount(Map<String, Object> map) {
		return gdao.getCount(map);
	}

	@Override
	public List<Zujinxinxi> select(Map<String, Object> map) {
		return gdao.select(map);
	}

	@Override
	public Zujinxinxi getById(int id) {
		return gdao.selectByPrimaryKey(id);
	}

}

