package com.lifat.CircuitsCourtsApi.repository;

import com.lifat.CircuitsCourtsApi.model.Adresse;
import com.lifat.CircuitsCourtsApi.model.Client;
import org.springframework.data.repository.CrudRepository;

public interface AdresseRepository extends CrudRepository<Adresse, Long> {

    Iterable<Adresse> getAdressesByClient(Client client);

}
