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
}
