package com.lifat.CircuitsCourtsApi.repository;

import com.lifat.CircuitsCourtsApi.model.CommandeDetail;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.Collection;

@Repository
public interface CommandeDetailRepository extends CrudRepository<CommandeDetail, Long> {

    Iterable<CommandeDetail> findByIdCommande(Long commandeId);

    Iterable<CommandeDetail> findAllByIdCommande(Long commandeId);

    @Query(value = "SELECT * FROM commande_details cd INNER JOIN commandes c ON c.id = cd.id_commande INNER JOIN commande_producteur" +
            " cp ON cp.id_commande_details = cd.id WHERE cp.id_producteur = :idProd AND c.id = :idCommande", nativeQuery = true)
    Iterable<CommandeDetail> findCommandeDetailsByCommandesAndProducteur(@Param("idProd") Long idProd, @Param("idCommande") Long idCommande);
}