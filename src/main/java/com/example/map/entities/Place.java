package com.example.map.entities;

import javax.persistence.*;

@Entity
public class Place {
	@Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
	String name;
	float lng;
	float lat;
	@ManyToOne(fetch = FetchType.LAZY)
	City city;
	int kolvoIzberat;
	int yavka;
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
	public float getLng() {
		return lng;
	}
	public void setLng(float lng) {
		this.lng = lng;
	}
	public float getLat() {
		return lat;
	}
	public void setLat(float lat) {
		this.lat = lat;
	}
	public City getCity() {
		return city;
	}
	public void setCity(City city) {
		this.city = city;
	}
	public int getKolvoIzberat() {
		return kolvoIzberat;
	}
	public void setKolvoIzberat(int kolvoIzberat) {
		this.kolvoIzberat = kolvoIzberat;
	}
	public int getYavka() {
		return yavka;
	}
	public void setYavka(int yavka) {
		this.yavka = yavka;
	}
	
	
	
}
