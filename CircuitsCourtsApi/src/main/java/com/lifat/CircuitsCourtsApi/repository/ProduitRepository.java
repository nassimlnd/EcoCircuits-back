package com.lifat.CircuitsCourtsApi.repository;

import com.lifat.CircuitsCourtsApi.model.Produit;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.Collection;
import java.util.Optional;

@Repository
public interface ProduitRepository extends CrudRepository<Produit, Long> {
    @Query(value = "SELECT * FROM produits p INNER JOIN produits_producteurs pp ON p.id = pp.id_produit " +
            "INNER JOIN producteurs pr ON pp.id_producteur = pr.id_producteur WHERE pr.id_producteur = :idProd", nativeQuery = true)
    Collection<Produit> findProduitsByProducteur(@Param("idProd")Long idProd);

    @Query(value = "SELECT * FROM produits p INNER JOIN commande_details cd ON p.id=cd.id_produit WHERE cd.id_commande = :idCommande", nativeQuery = true)
    Iterable<Produit> findProductsByOrder(Long idCommande);

}
