package com.example.map.dao;

import com.example.map.entities.City;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;




@Repository
public interface CityDao extends JpaRepository<City,Long> {
	@Query(value = "select b.* from city b where b.city_name=?1", nativeQuery = true)
	public List<City> findBycity_name(String city_name);
/*	public City cityAdd(City city);
	public List<City> getAll();
	public int getMaxId();
	public City getCityById(int id);*/

}
