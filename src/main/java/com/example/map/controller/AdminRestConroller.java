package com.example.map.controller;

import java.util.List;

import com.example.map.dao.CityDao;
import com.example.map.entities.City;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;


@RestController
public class AdminRestConroller {
	
	@Autowired
	CityDao cityDao;
	
	@RequestMapping("/getAllCities")
	public List<City> mainpage() {
		return cityDao.findAll();
	}
	
	@RequestMapping(value ="/getCityById")
	public City getById(@RequestParam(value = "id") long id) {
		return cityDao.findOne(id);
	}
}
