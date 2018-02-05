package com.example.map.dao;

import com.example.map.entities.City;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;




@Repository
public interface CityDao extends JpaRepository<City,Long> {
/*	public City cityAdd(City city);
	public List<City> getAll();
	public int getMaxId();
	public City getCityById(int id);*/

}
