package com.lifat.CircuitsCourtsApi.repository;


import com.lifat.CircuitsCourtsApi.model.Jwt;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface JwtRepository extends CrudRepository<Jwt, Long> {
}
