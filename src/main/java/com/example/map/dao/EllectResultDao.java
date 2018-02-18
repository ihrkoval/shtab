package com.example.map.dao;

import com.example.map.entities.EllectionResult;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

/**
 * Created by anton on 12.02.2018.
 */
public interface EllectResultDao extends JpaRepository<EllectionResult,Long> {
    @Query(value = "SELECT el.* FROM ellection_result el, place p, city c where  year(election_date) = ?2 and c.city_name = ?1 and p.city_id = c.id and el.place_id = p.id", nativeQuery = true)
    public List<EllectionResult> findBycityAndYear(String city_name, int year);

    @Query(value = "SELECT el.* FROM ellection_result el, place p, city c, partia pa where  year(el.election_date) = ?2 and c.city_name = ?1 and p.city_id = c.id and el.place_id = p.id and pa.type=?3 and el.partia_id = pa.id", nativeQuery = true)
    public List<EllectionResult> findBycityAndYearAndType(String city_name, int year, String type);

    @Query(value = "SELECT el.* FROM ellection_result el, place p, city c, partia pa where  year(el.election_date) = ?2 and c.rayon_name = ?1 and p.city_id = c.id and el.place_id = p.id and pa.type=?3 and el.partia_id = pa.id", nativeQuery = true)
    public List<EllectionResult> findByRayonAndYearAndType(String rayon_name, int year, String type);

    @Query(value = "SELECT el.* FROM ellection_result el, place p, city c, partia pa where  year(el.election_date) = ?2 and c.otg = ?1 and p.city_id = c.id and el.place_id = p.id and pa.type=?3 and el.partia_id = pa.id", nativeQuery = true)
    public List<EllectionResult> findByOtgAndYearAndType(String rayon_name, int year, String type);
}

