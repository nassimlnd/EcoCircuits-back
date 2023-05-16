package com.lifat.CircuitsCourtsApi.repository;

import com.lifat.CircuitsCourtsApi.model.Produit;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ProduitRepository extends CrudRepository<Produit, Long> {

    //Iterable<Produit> findAllByProducteurId(Long id);
}
