package com.lifat.CircuitsCourtsApi.repository;

import com.lifat.CircuitsCourtsApi.model.Produit;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.Collection;

@Repository
public interface ProduitRepository extends CrudRepository<Produit, Long> {

    //Iterable<Produit> findAllByProducteurId(Long id);

    @Query(value = "SELECT * FROM produits p INNER JOIN produits_producteurs pp ON p.id = pp.id_produit " +
            "INNER JOIN producteurs pr ON pp.id_producteur = pr.id_producteur WHERE pr.id_producteur = :idProd", nativeQuery = true)
    Collection<Produit> findProduitsByProducteur(@Param("idProd")Long idProd);
}
