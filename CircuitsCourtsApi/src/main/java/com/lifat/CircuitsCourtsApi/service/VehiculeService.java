package com.lifat.CircuitsCourtsApi.service;

import com.lifat.CircuitsCourtsApi.model.Vehicule;
import com.lifat.CircuitsCourtsApi.repository.VehiculeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class VehiculeService {
    @Autowired
    private VehiculeRepository vehiculeRepository;

    public Iterable<Vehicule> getAllVehicules(){
        return vehiculeRepository.findAll();
    }

    public Optional<Vehicule> getVehiculeById(Long id){
        return vehiculeRepository.findById(id);
    }

    public Vehicule saveVehicule(Vehicule vehicule){
        return vehiculeRepository.save(vehicule);
    }

    public void deletVehiculeById(Long id){
        vehiculeRepository.deleteById(id);
    }
}
