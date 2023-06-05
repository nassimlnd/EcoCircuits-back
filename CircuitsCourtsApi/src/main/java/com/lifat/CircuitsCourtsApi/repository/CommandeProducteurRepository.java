package com.lifat.CircuitsCourtsApi.repository;

import com.lifat.CircuitsCourtsApi.model.Commande;
import com.lifat.CircuitsCourtsApi.model.CommandeDetail;
import com.lifat.CircuitsCourtsApi.model.CommandeProducteur;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.security.core.parameters.P;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestBody;

import javax.transaction.Transactional;
import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

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

    @Query(value = "SELECT cp.* FROM commande_details cd INNER JOIN commande_producteur cp ON cd.id = cp.id_commande_details WHERE cd.id = :idCommandeDetail", nativeQuery = true)
    Iterable<CommandeProducteur> findCommandeProdByCommandeDetail(@Param("idCommandeDetail") Long idCommandeDetail);

    @Modifying
    @Transactional
    @Query(value = "UPDATE produits_producteurs SET quantite = quantite + :quantite WHERE id_producteur = :idProducteur AND id_produit = :idProduit", nativeQuery = true)
    void reatributStockToProducteur(@Param("idProducteur") Long idProducteur, @Param("idProduit") Long idProduit, @Param("quantite") Float quantite);

    @Query(value = "SELECT * FROM commande_producteur WHERE id_producteur = :idProducteur", nativeQuery = true)
    List<CommandeProducteur> findAllByIdProducteur(@Param("idProducteur") Long idProducteur);
}
