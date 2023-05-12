package com.lifat.CircuitsCourtsApi.repository;

import com.lifat.CircuitsCourtsApi.model.Commande;
import com.lifat.CircuitsCourtsApi.model.CommandeProducteur;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CommandeProducteurRepository extends CrudRepository<CommandeProducteur, Long> {

    CommandeProducteur findByidCommandeDetails(Long idCommandeDetails);
    Iterable<CommandeProducteur> findByIdProducteur(Long idProducteur);
}
