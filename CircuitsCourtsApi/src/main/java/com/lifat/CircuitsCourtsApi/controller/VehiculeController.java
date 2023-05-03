package com.lifat.CircuitsCourtsApi.controller;

import com.lifat.CircuitsCourtsApi.model.Producteur;
import com.lifat.CircuitsCourtsApi.model.Vehicule;
import com.lifat.CircuitsCourtsApi.service.VehiculeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api")
public class VehiculeController {

    @Autowired
    private VehiculeService vehiculeService;

    @GetMapping("/vehicules")
    public Iterable<Vehicule> getAllVehicules(){
        return vehiculeService.getAllVehicules();
    }

    @GetMapping("/vehicules/{id}")
    public Vehicule getVehiculeById(@PathVariable Long id){
        return vehiculeService.getVehiculeById(id);
    }

    @PostMapping("/vehicules")
    public Vehicule saveVehicule(@RequestBody Vehicule vehicule){
        return vehiculeService.saveVehicule(vehicule);
    }

    @DeleteMapping("/vehicules/{id}")
    public void deletVehiculebyId(@PathVariable Long id){
        vehiculeService.deletVehiculeById(id);
    }
}
