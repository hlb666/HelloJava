package com.server.impl;

import java.util.List;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dao.FangyuanxinxiMapper;
import com.entity.Fangyuanxinxi;
import com.server.FangyuanxinxiServer;
@Service
public class FangyuanxinxiServerImpi implements FangyuanxinxiServer {
   @Resource
   private FangyuanxinxiMapper gdao;
	@Override
	public int add(Fangyuanxinxi po) {
		return gdao.insert(po);
	}

	@Override
	public int update(Fangyuanxinxi po) {
		return gdao.updateByPrimaryKeySelective(po);
	}

	
	
	@Override
	public int delete(int id) {
		return gdao.deleteByPrimaryKey(id);
	}

	@Override
	public List<Fangyuanxinxi> getAll(Map<String, Object> map) {
		return gdao.getAll(map);
	}
	
	public List<Fangyuanxinxi> getsyfangyuanxinxi1(Map<String, Object> map) {
		return gdao.getsyfangyuanxinxi1(map);
	}
	public List<Fangyuanxinxi> getsyfangyuanxinxi2(Map<String, Object> map) {
		return gdao.getsyfangyuanxinxi2(map);
	}
	public List<Fangyuanxinxi> getsyfangyuanxinxi3(Map<String, Object> map) {
		return gdao.getsyfangyuanxinxi3(map);
	}
	
	@Override
	public Fangyuanxinxi quchongFangyuanxinxi(Map<String, Object> account) {
		return gdao.quchongFangyuanxinxi(account);
	}

	@Override
	public List<Fangyuanxinxi> getByPage(Map<String, Object> map) {
		return gdao.getByPage(map);
	}

	@Override
	public int getCount(Map<String, Object> map) {
		return gdao.getCount(map);
	}

	@Override
	public List<Fangyuanxinxi> select(Map<String, Object> map) {
		return gdao.select(map);
	}

	@Override
	public Fangyuanxinxi getById(int id) {
		return gdao.selectByPrimaryKey(id);
	}

	@Override
	public List<Fangyuanxinxi> selectCode() {
		
		return gdao.selectCode();
	}

}

