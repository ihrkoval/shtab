package com.example.map.dao;

import com.example.map.entities.Place;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Created by anton on 07.02.2018.
 */
public interface PlaceDao extends JpaRepository<Place,Long> {
}
