package com.example.map.dao;

import com.example.map.entities.Partia;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

/**
 * Created by anton on 05.02.2018.
 */
public interface PartiaDao extends JpaRepository<Partia,Long> {
    @Query(value = "select p.* from partia p where p.type = ?1 and year(p.eldate) = ?2", nativeQuery = true)//"select b.* from city b where b.city_name=?1", nativeQuery = true)
    public List<Partia> findByTypeAndDate(String type, int year);
}
