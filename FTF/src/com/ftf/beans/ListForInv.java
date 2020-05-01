package com.ftf.beans;

import java.util.List;

public class ListForInv {
	private List<Team> teaList;
	private List<InvolueTeam> involueTeams;
	public List<Team> getTeaList() {
		return teaList;
	}
	public void setTeaList(List<Team> teaList) {
		this.teaList = teaList;
	}
	public List<InvolueTeam> getInvolueTeams() {
		return involueTeams;
	}
	public void setInvolueTeams(List<InvolueTeam> involueTeams) {
		this.involueTeams = involueTeams;
	}
	public ListForInv(List<Team> teaList, List<InvolueTeam> involueTeams) {
		super();
		this.teaList = teaList;
		this.involueTeams = involueTeams;
	}
	public ListForInv() {
		super();
	}
	
	
	

}
