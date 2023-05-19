package com.lifat.CircuitsCourtsApi.repository;


import com.lifat.CircuitsCourtsApi.model.Producteur;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.Collection;

@Repository
public interface ProducteurRepository extends CrudRepository<Producteur, Long> {


    @Query(value = "SELECT * FROM producteurs p INNER JOIN produits_producteurs pp ON p.id_producteur = pp.id_producteur WHERE id_produit= :idProduit", nativeQuery = true)
    Collection<Producteur> findAllByProduit(@Param("idProduit")Long idProduit);


}
