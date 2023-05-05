package com.lifat.CircuitsCourtsApi.repository;

import com.lifat.CircuitsCourtsApi.model.Commande;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CommandeRepository extends CrudRepository<Commande, Long> {

    Iterable<Commande> findByIdClient(Long id);

}
