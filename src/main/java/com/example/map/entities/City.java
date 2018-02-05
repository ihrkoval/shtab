package com.example.map.entities;

import java.util.List;
import javax.persistence.*;

@Entity
public class City {
	    @Id
	    @GeneratedValue(strategy = GenerationType.AUTO)
	    private Long id;
	  
	String city_name;
	String oblast_name;
	String rayon_name;
	int rayon;
	int oblast;

	@OneToMany(mappedBy= "city", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	List<Place> places;
	
	public City(String name, int rayoun, int oblast) {
		this.city_name= name;
		this.rayon = rayoun;
		this.oblast = oblast;
	}

	public City (String name, String rayon, String oblast){
		city_name = name;
		rayon_name = rayon;
		oblast_name = oblast;
	}
	public City(){}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public void setCity_name(String city_name) {
		this.city_name = city_name;
	}

	public void setOblast(int oblast) {
		this.oblast = oblast;
	}

	public String getCity_name() {
		return city_name;
	}


	public int getRayoun() {
		return rayon;
	}


	public int getOblast() {
		return oblast;
	}



	public String getOblast_name() {
		return oblast_name;
	}

	public void setOblast_name(String oblast_name) {
		this.oblast_name = oblast_name;
	}

	public String getRayon_name() {
		return rayon_name;
	}

	public void setRayon_name(String rayon_name) {
		this.rayon_name = rayon_name;
	}

	public int getRayon() {
		return rayon;
	}

	public void setRayon(int rayon) {
		this.rayon = rayon;
	}

	public List<Place> getPlaces() {
		return places;
	}

	public void setPlaces(List<Place> places) {
		this.places = places;
	}
}
