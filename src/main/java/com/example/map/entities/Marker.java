package com.example.map.entities;

public class Marker {
	private Float lat;
	private Float lng;
	private String title;
	private String content;
	private MarkerType type;
	private City city_id;
	public Marker() {}
	
	public Float getLat() {
		return lat;
	}
	public void setLat(Float lat) {
		this.lat = lat;
	}
	public Float getLng() {
		return lng;
	}
	public void setLng(Float lng) {
		this.lng = lng;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public MarkerType getType() {
		return type;
	}
	public void setType(MarkerType type) {
		this.type = type;
	}
	public City getCity_id() {
		return city_id;
	}
	public void setCity_id(City city_id) {
		this.city_id = city_id;
	}
	
	
}
