package com.lifat.CircuitsCourtsApi.repository;

import com.lifat.CircuitsCourtsApi.model.Commande;
import com.lifat.CircuitsCourtsApi.model.CommandeProducteur;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestBody;

@Repository
public interface CommandeProducteurRepository extends CrudRepository<CommandeProducteur, Long> {

    CommandeProducteur findByidCommandeDetails(Long idCommandeDetails);
    Iterable<CommandeProducteur> findByIdProducteur(Long idProducteur);

    //la CommandeProducteur de la CommandesDetail d'une commande d'un producteur
    @Query(value = "SELECT * FROM commande_producteur cp INNER JOIN commande_details cd ON cp.id_commande_details = cd.id" +
            " WHERE cp.id_producteur =:idProd AND cd.id=:idCommandeDetail", nativeQuery = true)
    CommandeProducteur findCommandeProdByCommandeDetailAndProducteur(@Param("idProd")Long idProd, @Param("idCommandeDetail")Long idCommandeDetail);


    @Query(value ="SELECT * FROM commande_producteur cp INNER JOIN commande_details cd ON cp.id_commande_details = cd.id" +
            " INNER JOIN commandes c ON cd.id_commande = c.id WHERE c.id = :idCommande", nativeQuery = true)
    Iterable<CommandeProducteur> findCommandeProdByIdCommande(@Param("idCommande")Long idCommande);
}
