package com.example.map.controller;

import java.util.ArrayList;
import java.util.List;

import com.example.map.dao.CityDao;
import com.example.map.dao.EllectResultDao;
import com.example.map.dao.PartiaDao;
import com.example.map.dao.PlaceDao;
import com.example.map.entities.City;
import com.example.map.entities.EllectionResult;
import com.example.map.entities.Partia;
import com.example.map.entities.Place;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;


@RestController
public class AdminRestConroller {
	
	@Autowired
	CityDao cityDao;

	@Autowired
	PartiaDao partiaDao;

	@Autowired
	PlaceDao placeDao;

	@Autowired
	EllectResultDao ellectResultDao;

	@RequestMapping("/getAllCities")
	public List<City> mainpage(@RequestParam(value = "suggest", required = false) String by) {
					return cityDao.findAll();
	}

	@RequestMapping("/getAllPlaces")
	public List<Place> placesadd() {
		return placeDao.findAll();
	}

	@RequestMapping("/getallparties")
	public List<Partia> allParties() {
		return partiaDao.findAll();
	}

	@RequestMapping(value ="/delPlace")
	public void delPlace(@RequestParam(value = "id") long id) {
		placeDao.delete(id);
	}


	@RequestMapping(value ="/getCityById")
	public City getById(@RequestParam(value = "id") long id) {
		return cityDao.findOne(id);
	}

	@RequestMapping(value ="/delCity")
	public List<City> delCity(@RequestParam(value = "id") long id) {
		cityDao.delete(id);
		return cityDao.findAll();
	}
	@RequestMapping("/getdvkByCName")
	public List<Place> getdvk(@RequestParam(value = "id") String name,
							  @RequestParam(value = "t", required = false) String type ) {
		System.out.println(name + " "+type);
		if (type != null){
			if (type.equals("por")){
				return placeDao.findDvkByRayon(name);
			}
			if (type.equals("poo")){
				return placeDao.findDvkByOtg(name);
			}
		}
		return placeDao.findDvkByCity(name);
	}



	@RequestMapping("/getPartiesElTab")
	public List<Partia> getdvk(@RequestParam(value = "type") String type,
			@RequestParam(value = "year") int year) {
		return partiaDao.findByTypeAndDate(type, year);
	}

	@RequestMapping(value="/saveResults", method=RequestMethod.POST)
	@ResponseBody
	public void savePerson(@RequestBody List<EllectionResult> ellectionResult) {
		ellectResultDao.save(ellectionResult);
	}

	@RequestMapping(value="/getResult")
	@ResponseBody
	public  List<EllectionResult> getResult(@RequestParam String city_name, int year) {
		return ellectResultDao.findBycityAndYear(city_name, year);
	}

	@RequestMapping(value="/getagitplaces")
	@ResponseBody
	public  List<Place> getagitplaces() {
		return placeDao.getAgitNotNull();
	}

	@RequestMapping(value="/getResulttype")
	@ResponseBody
	public  List<EllectionResult> getResulttype(@RequestParam String city_name, int year, String type, String po) {
		List<EllectionResult> elres = new ArrayList<>();
		if (po.equals("poc")) {
			elres = ellectResultDao.findBycityAndYearAndType(city_name, year, type);
			System.out.println(elres.size() + " "+po);
		} else
		if (po.equals("por")){
			elres =ellectResultDao.findByRayonAndYearAndType(city_name, year, type);
			System.out.println(elres.size() + " "+po);
		} else

		if (po.equals("poo")) {
			elres = ellectResultDao.findByOtgAndYearAndType(city_name, year, type);
			System.out.println(elres.size() + " "+po);
		}
		System.out.println(elres.size() + " "+po);
		return elres;
	}





}
