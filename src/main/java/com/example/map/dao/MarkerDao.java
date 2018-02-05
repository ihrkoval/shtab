package com.example.map.dao;

import com.example.map.entities.Marker;

import java.util.List;



public interface MarkerDao {
	public List<Marker> getMarkersByType(int typeId);

}
