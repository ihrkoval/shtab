package com.example.map.controller;

import com.example.map.dao.CityDao;
import com.example.map.dao.PartiaDao;
import com.example.map.dao.PlaceDao;
import com.example.map.entities.City;
import com.example.map.entities.Partia;
import com.example.map.entities.Place;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.sql.Date;

@Controller
public class AdminPageController {

	@Autowired
	CityDao cityDao;

	@Autowired
	PartiaDao partiaDao;

	@Autowired
	PlaceDao placeDao;

	@RequestMapping("/admin")
	public ModelAndView mainpage() {
		ModelAndView model = new ModelAndView("admin");
		return model;
	}
	
	@RequestMapping(value = "/cityadd", method = RequestMethod.POST)
	public ModelAndView cityAddClick(
			@RequestParam(value = "id", required = false) Long id,
			@RequestParam(value = "name") String name,
            @RequestParam(value = "rayon") String rayon,
			@RequestParam(value = "otg") String otg,
            @RequestParam(value = "oblast") String oblast //, required = false
            ) 
	{
		ModelAndView model = new ModelAndView("admin");
		System.out.println(name + rayon+oblast);


		City city =  new City(name, rayon, oblast, otg);
		city.setId(id);
		System.out.println(" name "+city.getCity_name() +" obl "+ city.getOblast() + " rayon "+city.getRayoun());
		cityDao.saveAndFlush(city);
		return model;
	}

	@RequestMapping(value = "/partyadd", method = RequestMethod.POST)
	public ModelAndView partyAddClick(
			@RequestParam(value = "pname") String name,
			@RequestParam(value = "eldate") String eldate,
			@RequestParam(value = "ptype") String type//, required = false
	)
	{
		ModelAndView model = new ModelAndView("admin");
		Partia p = new Partia();
		p.setName(name);
		p.setType(type);
		p.setEldate(eldate);
		partiaDao.saveAndFlush(p);
		return model;
	}

	@RequestMapping("/addplace")
	public ModelAndView addplace() {
		ModelAndView model = new ModelAndView("addplaces");
		return model;
	}

	//TODO creaate a rest controller for place add
	@RequestMapping(value = "/placeadd", method = RequestMethod.POST)
	public ModelAndView placeadd(
			@RequestParam(value = "city") String city_name,
			@RequestParam(value = "id", required = false) Long id,
			@RequestParam(value = "ptype") String type,
			@RequestParam(value = "num", required = false) String num,
			@RequestParam(value = "name", required = false) String name,
			@RequestParam(value = "agit", required = false) String agit,
			@RequestParam(value = "lat") Float lat,//, required = false
			@RequestParam(value = "lng") Float lng//, required = false
	)
	{
		ModelAndView model = new ModelAndView("addplaces");
		Place p = new Place();
		System.out.println(" name param = "+city_name);
		City c = cityDao.findBycity_name(city_name).get(0);

		p.setId(id);
		p.setCity(c);
		p.setType(type);
		p.setLat(lat);
		p.setLng(lng);
		p.setName(name);
		p.setNum(num);
		p.setAgit(agit);
		placeDao.saveAndFlush(p);
		return model;
	}





}
