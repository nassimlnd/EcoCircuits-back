package com.lifat.CircuitsCourtsApi.repository;

import com.lifat.CircuitsCourtsApi.model.CommandeDetail;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.Collection;

@Repository
public interface CommandeDetailRepository extends CrudRepository<CommandeDetail, Long> {

    CommandeDetail findByIdCommande(Long commandeId);

    Iterable<CommandeDetail> findAllByIdCommande(Long commandeId);
}
