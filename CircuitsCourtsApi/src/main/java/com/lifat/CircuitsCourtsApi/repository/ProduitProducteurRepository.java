package com.lifat.CircuitsCourtsApi.repository;

import com.lifat.CircuitsCourtsApi.model.ProduitProducteurId;
import com.lifat.CircuitsCourtsApi.model.ProduitsProducteurs;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ProduitProducteurRepository extends CrudRepository<ProduitsProducteurs, ProduitProducteurId> {
}
