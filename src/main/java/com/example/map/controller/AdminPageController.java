package com.example.map.controller;

import com.example.map.dao.CityDao;
import com.example.map.dao.PartiaDao;
import com.example.map.entities.City;
import com.example.map.entities.Partia;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminPageController {

	@Autowired
	CityDao cityDao;

	@Autowired
	PartiaDao partiaDao;

	@RequestMapping("/admin")
	public ModelAndView mainpage() {
		ModelAndView model = new ModelAndView("admin");
		return model;
	}
	
	@RequestMapping(value = "/cityadd", method = RequestMethod.POST)
	public ModelAndView cityAddClick(
			@RequestParam(value = "name") String name,
            @RequestParam(value = "rayon") String rayon,
            @RequestParam(value = "oblast") String oblast //, required = false
            ) 
	{
		ModelAndView model = new ModelAndView("admin");
		System.out.println(name + rayon+oblast);


		City city =  new City(name, rayon, oblast);
		System.out.println(" name "+city.getCity_name() +" obl "+ city.getOblast() + " rayon "+city.getRayoun());
		cityDao.saveAndFlush(city);
		return model;
	}

	@RequestMapping(value = "/partyadd", method = RequestMethod.POST)
	public ModelAndView partyAddClick(
			@RequestParam(value = "pname") String name //, required = false
	)
	{
		ModelAndView model = new ModelAndView("admin");
		Partia p = new Partia();
		p.setName(name);
		partiaDao.saveAndFlush(p);
		return model;
	}
}
