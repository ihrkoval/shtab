package com.example.map.dao;

import com.example.map.entities.City;
import com.example.map.entities.Place;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

/**
 * Created by anton on 07.02.2018.
 */


public interface PlaceDao extends JpaRepository<Place,Long> {
    @Query(value = "select b.* from place b, city c where b.type = 'ДВК' and c.id = b.city_id and c.city_name=?1", nativeQuery = true)
    public List<Place> findDvkByCity(String id);

    @Query(value = "select b.* from place b, city c where b.type = 'ДВК' and c.id = b.city_id and c.rayon_name=?1", nativeQuery = true)
    public List<Place> findDvkByRayon(String name);

    @Query(value = "select b.* from place b, city c where b.type = 'ДВК' and c.id = b.city_id and c.otg=?1", nativeQuery = true)
    public List<Place> findDvkByOtg(String name);


}
