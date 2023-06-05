package com.lifat.CircuitsCourtsApi.service;

import com.lifat.CircuitsCourtsApi.model.Adresse;
import com.lifat.CircuitsCourtsApi.model.Client;
import com.lifat.CircuitsCourtsApi.repository.AdresseRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdresseService {

    @Autowired
    private AdresseRepository adresseRepository;

    public Iterable<Adresse> getAdressesByClient(Client client) {
        return adresseRepository.getAdressesByClient(client);
    }

    public Adresse save(Adresse adresse) {
        return adresseRepository.save(adresse);
    }

    public void deleteById(Long id) {
        adresseRepository.deleteById(id);
    }

    public Adresse findById(Long id) {
        return adresseRepository.findById(id).get();
    }

    public Iterable<Adresse> findAll() {
        return adresseRepository.findAll();
    }

}
