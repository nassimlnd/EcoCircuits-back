package com.lifat.CircuitsCourtsApi.repository;

import com.lifat.CircuitsCourtsApi.model.ProduitProducteurId;
import com.lifat.CircuitsCourtsApi.model.ProduitsProducteurs;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ProduitPorducteurRepository extends CrudRepository<ProduitsProducteurs, ProduitProducteurId> {
}
