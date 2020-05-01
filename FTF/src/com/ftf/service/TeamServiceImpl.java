package com.ftf.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ftf.beans.Admin;
import com.ftf.beans.InvolueTeam;
import com.ftf.beans.Search;
import com.ftf.beans.Team;
import com.ftf.beans.Type;
import com.ftf.beans.User;
import com.ftf.dao.TeamMapper;
import com.ftf.dao.UserLoginMapper;
import com.ftf.dao.UserUpdateMapper;


@Service
public class TeamServiceImpl implements ITeamService{

	@Autowired
	public TeamMapper mapper;
	
	
	@Autowired
	public UserLoginMapper userLoginMapper;
	
	@Override
	public void insert(Team team) {
		mapper.insert(team);	
	}

	@Override
	public List<Team> getAll(Team team) {
		
		
		return mapper.getAll(team);
	}

	@Override
	public Team getById(int id) {
		Team team = mapper.getById(id);
		return team;
	}

	@Override
	public Type getAllById(Type type) {
		Type types= mapper.getAllById(type);
		return types;
	}

	@Override
	public void addToInvolve(InvolueTeam involueTeam) {
		mapper.addToInvolve(involueTeam);		
	}

	@Override
	public List<Team> getAllStart(Team team) {
	  List<Team> list = mapper.getAllStart(team);
		return list;
	}

	@Override
	public List<InvolueTeam> involueTeams(int sid) {
		List<InvolueTeam> involueTeams = mapper.involueTeams(sid);
		return involueTeams;
	}

	@Override
	public List<InvolueTeam> involueTeamfrorEc(int sid) {
	    List<InvolueTeam> involueTeams = mapper.involueTeamfrorEc(sid);	    
		return involueTeams;
	}

	@Override
	public List<InvolueTeam> involueTeamsfrorAll(int uid) {
		List<InvolueTeam> involueTeams = mapper.involueTeamsfrorAll(uid);
		return involueTeams;
	}

	public void deleteInvolve(int id) {
		mapper.deleteInvolve(id);		
	}

	@Override
	public void deleteLuanch(int id) {
		mapper.deleteLuanch(id);
		
	}
	@Override
	public List<Team> getAlladmin(){
		List<Team> lis = mapper.getAlladmin();
		return lis;
		
	}
	@Override
	public List<User> getAlluser(){
		List<User> lists = mapper.getAlluser();
		return lists;
		
	}

	@Override
	public void search(Search search) {
		mapper.search(search);

	}

	@Override
	public List<Search> getSea(Search search) {
		List<Search> getSea=mapper.getSea(search);
		return getSea;
	}

	
}
