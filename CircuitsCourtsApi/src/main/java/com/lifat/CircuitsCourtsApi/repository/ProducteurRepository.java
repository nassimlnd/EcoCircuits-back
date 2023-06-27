package com.lifat.CircuitsCourtsApi.repository;


import com.lifat.CircuitsCourtsApi.model.Producteur;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import org.springframework.data.repository.query.Param;
import org.springframework.security.core.parameters.P;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;
import java.beans.Transient;
import java.util.Collection;
import java.util.Optional;

@Repository
public interface ProducteurRepository extends CrudRepository<Producteur, Long> {
    @Query(value = "SELECT * FROM producteurs p INNER JOIN produits_producteurs pp ON p.id_producteur = pp.id_producteur WHERE id_produit= :idProduit", nativeQuery = true)
    Collection<Producteur> findAllByProduit(@Param("idProduit")Long idProduit);

    /**
     * modifie la quantite d'un produit d'un producteur
     * @param idProd
     * @param idProduit
     * @param qte
     */
    @Modifying
    @Transactional
    @Query(value = "UPDATE produits_producteurs SET quantite = quantite - :qte WHERE id_producteur = :idProd AND id_produit = :idProduit", nativeQuery = true)
    void updateQteProduit(@Param("idProd")Long idProd, @Param("idProduit")Long idProduit, @Param("qte")Float qte);

    @Query(value = "SELECT quantite FROM produits_producteurs WHERE id_producteur = :idProd AND id_produit = :idProduit", nativeQuery = true)
    Optional<Float> getQteProduit(@Param("idProd")Long idProd, @Param("idProduit")Long idProduit);

    @Query(value = "SELECT * FROM producteurs p INNER JOIN commande_producteur cp ON p.id_producteur = cp.id_producteur INNER JOIN commande_details cd ON cp.id_commande_details = cd.id INNER JOIN commandes c ON cd.id_commande = c.id WHERE c.id = :idCommande", nativeQuery = true)
    Iterable<Producteur> getProducteurByOrder(Long idCommande);
}
