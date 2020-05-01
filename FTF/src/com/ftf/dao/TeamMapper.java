package com.ftf.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ftf.beans.InvolueTeam;
import com.ftf.beans.Search;
import com.ftf.beans.Team;
import com.ftf.beans.Type;
import com.ftf.beans.User;


public interface TeamMapper {
	public void insert(@Param("team")Team team);
	public List<Team> getAll(@Param("team")Team team);
	public Team getById(int id);
	public Type getAllById(@Param("type")Type type);
	public void addToInvolve(@Param("involueTeam")InvolueTeam involueTeam);
	public List<Team> getAllStart(@Param("team")Team team);
	
	public List<Team> getAlladmin();
	public List<User> getAlluser();
	
	public List<InvolueTeam> involueTeams(int sid);
	public List<InvolueTeam> involueTeamfrorEc(int sid);
	public List<InvolueTeam> involueTeamsfrorAll(int uid);
	public void deleteInvolve(int id);
	public void deleteLuanch(int id);
	public void search(@Param("search")Search search);
	public List<Search> getSea(@Param("search")Search search);
	
	

	
	
	
}
