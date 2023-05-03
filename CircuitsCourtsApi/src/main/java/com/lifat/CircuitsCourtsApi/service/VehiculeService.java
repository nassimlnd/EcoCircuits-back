package com.lifat.CircuitsCourtsApi.service;

import com.lifat.CircuitsCourtsApi.model.Vehicule;
import com.lifat.CircuitsCourtsApi.repository.VehiculeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class VehiculeService {
    @Autowired
    private VehiculeRepository vehiculeRepository;

    public Iterable<Vehicule> getAllVehicules(){
        return vehiculeRepository.findAll();
    }

    public Vehicule getVehiculeById(Long id){
        return vehiculeRepository.findById(id).get();
    }

    public Vehicule saveVehicule(Vehicule vehicule){
        Vehicule savedVehicule = vehiculeRepository.save(vehicule);
        return vehicule;
    }

    public void deletVehiculeById(Long id){
        vehiculeRepository.deleteById(id);
    }
}
