package com.lifat.CircuitsCourtsApi.repository;


import com.lifat.CircuitsCourtsApi.model.Producteur;

import org.springframework.data.repository.CrudRepository;

import org.springframework.stereotype.Repository;

@Repository
public interface ProducteurRepository extends CrudRepository<Producteur, Long> {



}
