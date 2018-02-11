package com.example.map.entities;


//import javax.persistence.*;

import javax.persistence.*;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

@Entity
public class Partia {
	
	
	@Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
	String name;
	String type;
	Date eldate;

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public void setEldate(String eldate){
		SimpleDateFormat format = new SimpleDateFormat("dd/mm/yyyy");
		try {
			this.eldate =  new Date(format.parse(eldate).getTime());
		} catch (ParseException e) {
			e.printStackTrace();
		}
	}

	public Date getEldate() {
		return eldate;
	}

	public void setEldate(Date eldate) {
		this.eldate = eldate;
	}

	public Partia() {}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	
}
