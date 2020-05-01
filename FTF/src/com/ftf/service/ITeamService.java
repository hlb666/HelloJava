package com.ftf.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ftf.beans.Admin;
import com.ftf.beans.InvolueTeam;
import com.ftf.beans.Search;
import com.ftf.beans.Team;
import com.ftf.beans.Type;
import com.ftf.beans.User;

public interface ITeamService {
	public void insert(Team team);
	public List<Team> getAll(Team team);
	public Team getById(int id);
	public Type getAllById(Type type);
	public void addToInvolve(InvolueTeam involueTeam);
	public List<Team> getAllStart(Team team);
	public List<InvolueTeam> involueTeams(int sid);
	public List<InvolueTeam> involueTeamfrorEc(int sid);
	public List<InvolueTeam> involueTeamsfrorAll(int uid);
	public void deleteInvolve(int id);
	public void deleteLuanch(int id);
	public List<Team> getAlladmin();
	public List<User> getAlluser();
	public void search(Search search);
	public List<Search> getSea(Search search);
}
