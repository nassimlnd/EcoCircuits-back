package com.lifat.CircuitsCourtsApi.controller;

import com.lifat.CircuitsCourtsApi.model.Hub;
import com.lifat.CircuitsCourtsApi.service.HubSrevice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
@CrossOrigin(origins = "http://localhost:3000")
@RestController
@RequestMapping("/api")
/**
 * End point de l'api pour les Hubs.
 * Le nom des méthodes décrit leurs fonctionnement.
 */
public class HubController {


    @Autowired
    private HubSrevice hubSrevice;

    @PreAuthorize("hasRole('ADMIN') or hasRole('ORGANISATEUR') or hasRole('PRODUCTEUR')")
    @GetMapping("/hubs")
    public ResponseEntity<?> getAllHubs(){
            return ResponseEntity.ok(hubSrevice.getAllHubs());

    }

    @PreAuthorize("hasRole('ADMIN') or hasRole('ORGANISATEUR') or hasRole('PRODUCTEUR')")
    @GetMapping("/hubs/{id}")
    public ResponseEntity<?> getHubById(@PathVariable Long id){
            return ResponseEntity.ok(hubSrevice.getHubById(id));
    }

    @PreAuthorize("hasRole('ADMIN') or hasRole('ORGANISATEUR')")
    @PostMapping("/hubs")
    public ResponseEntity<?> saveHub(@RequestBody Hub hub){
            return ResponseEntity.ok(hubSrevice.saveHub(hub));
    }

    @PreAuthorize("hasRole('ADMIN') or hasRole('ORGANISATEUR')")
    @DeleteMapping("/hub/{id}")
    public ResponseEntity<?> deletHubById(@PathVariable Long id){
            hubSrevice.deletHubById(id);
            return ResponseEntity.ok("Hub with ID " + id + " was deleted.");
    }
}
