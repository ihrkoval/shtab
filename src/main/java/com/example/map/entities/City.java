package com.example.map.entities;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import java.util.List;
import javax.persistence.*;

@Entity
@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
public class City {
	    @Id
	    @GeneratedValue(strategy = GenerationType.AUTO)
	    private Long id;
	  
	String city_name;
	String oblast_name;
	String rayon_name;
	String otg;


	int rayon;
	int oblast;

	@JsonIgnore
	@OneToMany(mappedBy= "city", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	List<Place> places;
	
	public City(String name, int rayoun, int oblast) {
		this.city_name= name;
		this.rayon = rayoun;
		this.oblast = oblast;
	}

	public City (String name, String rayon, String oblast, String otg){
		city_name = name;
		rayon_name = rayon;
		oblast_name = oblast;
		this.otg =otg;
	}
	public City(){}

	public String getOtg() {
		return otg;
	}

	public void setOtg(String otg) {
		this.otg = otg;
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


	public Long getId() {
		return id;
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
