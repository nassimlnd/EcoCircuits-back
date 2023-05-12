package com.lifat.CircuitsCourtsApi.controller;

import com.lifat.CircuitsCourtsApi.model.Vehicule;
import com.lifat.CircuitsCourtsApi.service.VehiculeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

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
}
