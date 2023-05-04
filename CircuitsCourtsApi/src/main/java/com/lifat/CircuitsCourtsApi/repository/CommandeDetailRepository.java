package com.lifat.CircuitsCourtsApi.repository;

import com.lifat.CircuitsCourtsApi.model.CommandeDetail;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CommandeDetailRepository extends CrudRepository<CommandeDetail, Long> {

    CommandeDetail findByIdCommande(Long commandeId);
}
