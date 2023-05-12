package com.lifat.CircuitsCourtsApi.repository;

import com.lifat.CircuitsCourtsApi.model.Commande;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface CommandeRepository extends CrudRepository<Commande, Long> {

    Iterable<Commande> findByIdClient(Long id);

    Optional<Commande> findAllCommandeById(Long idCommande);

    @Query(value = "SELECT Commande FROM Commande c INNER JOIN CommandeDetail cd ON c.id = cd.idCommande INNER JOIN CommandeProducteur cp ON cd.id = cp.idCommandeDetails WHERE cp.idProducteur = :idProd", nativeQuery = true)
    Iterable<Commande> findAllCommandesByProducteur(@Param("idProd")Long idProd);




}
