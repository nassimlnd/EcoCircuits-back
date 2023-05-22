package com.lifat.CircuitsCourtsApi.controller;

import com.lifat.CircuitsCourtsApi.model.Vehicule;
import com.lifat.CircuitsCourtsApi.service.VehiculeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.Optional;

@CrossOrigin(origins = "http://localhost:3000")
@RestController
@RequestMapping("/api")
public class VehiculeController {

    @Autowired
    private VehiculeService vehiculeService;

    @PreAuthorize("hasRole('ADMIN') or hasRole('ORGANISATEUR')")
    @GetMapping("/vehicules")
    public ResponseEntity<?> getAllVehicules() {
        return ResponseEntity.ok(vehiculeService.getAllVehicules());
    }

    @PreAuthorize("hasRole('ADMIN') or hasRole('ORGANISATEUR')")
    @GetMapping("/vehicules/{id}")
    public ResponseEntity<?> getVehiculeById(@PathVariable Long id) {
        Optional<Vehicule> existingVehicule = vehiculeService.getVehiculeById(id);
        if(existingVehicule.isEmpty()){
            return ResponseEntity.badRequest().body("le vehicule n°"+ id+" n'existe pas");
        }
        return ResponseEntity.ok(vehiculeService.getVehiculeById(id));
    }

    @PreAuthorize("hasRole('ADMIN') or hasRole('ORGANISATEUR')")
    @PostMapping("/vehicules")
    public ResponseEntity<?> saveVehicule(@RequestBody Vehicule vehicule) {
        return ResponseEntity.ok(vehiculeService.saveVehicule(vehicule));
    }

    @PreAuthorize("hasRole('ADMIN') or hasRole('ORGANISATEUR')")
    @DeleteMapping("/vehicules/{id}")
    public ResponseEntity<?> deletVehiculebyId(@PathVariable Long id) {
        vehiculeService.deletVehiculeById(id);
        return ResponseEntity.ok("vehicule n°" + id + "has been deleted");

    }


    @PreAuthorize("hasRole('ADMIN') or hasRole('ORGANISATEUR') or hasRole('PRODUCTEUR')")
    @PutMapping("/vehicule/update/{id}")
    public ResponseEntity<?> updateVehicule(@PathVariable Long id, @RequestBody Vehicule vehicule){
        Optional<Vehicule> existingVehicule = vehiculeService.getVehiculeById(id);
        if(existingVehicule.isEmpty()){
            return ResponseEntity.badRequest().body("le vehicule n°" + id+ " n'existe pas.");
        }
        vehiculeService.saveVehicule(vehicule);
        return ResponseEntity.ok().body(vehicule);
    }
}
