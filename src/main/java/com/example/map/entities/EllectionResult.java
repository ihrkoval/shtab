package com.example.map.entities;

import java.sql.Date;

import javax.persistence.*;

@Entity
public class EllectionResult {
		
	 	@Id
	    @GeneratedValue(strategy = GenerationType.AUTO)
	    private Long id;
	 	
		Date electionDate;
		
		@OneToOne(fetch = FetchType.LAZY)
		Partia partia;
		@OneToOne(fetch = FetchType.LAZY)
		Place place;
		
		int votes;
		int yavka;
		int allcount;

	public int getAllcount() {
		return allcount;
	}

	public void setAllcount(int allcount) {
		this.allcount = allcount;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Date getElectionDate() {
		return electionDate;
	}

	public void setElectionDate(Date electionDate) {
		this.electionDate = electionDate;
	}

	public Partia getPartia() {
		return partia;
	}

	public void setPartia(Partia partia) {
		this.partia = partia;
	}

	public Place getPlace() {
		return place;
	}

	public void setPlace(Place place) {
		this.place = place;
	}

	public int getVotes() {
		return votes;
	}

	public void setVotes(int votes) {
		this.votes = votes;
	}

	public int getYavka() {
		return yavka;
	}

	public void setYavka(int yavka) {
		this.yavka = yavka;
	}
}
