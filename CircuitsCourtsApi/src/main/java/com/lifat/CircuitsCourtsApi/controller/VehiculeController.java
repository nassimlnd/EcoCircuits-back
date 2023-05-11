package com.lifat.CircuitsCourtsApi.controller;

import com.lifat.CircuitsCourtsApi.JWTEndPointsProtection.JwtUtil;
import com.lifat.CircuitsCourtsApi.model.Vehicule;
import com.lifat.CircuitsCourtsApi.service.VehiculeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
@CrossOrigin(origins = "http://localhost:3000")
@RestController
@RequestMapping("/api")
public class VehiculeController {

    @Autowired
    private JwtUtil jwtUtil;
    @Autowired
    private VehiculeService vehiculeService;

    @GetMapping("/vehicules")
    public ResponseEntity<?> getAllVehicules(@RequestParam String key) throws Exception {
       if(jwtUtil.isValidToken(key)){
           return ResponseEntity.ok(vehiculeService.getAllVehicules());
       }else return ResponseEntity.badRequest().body("Invalid Token");
    }

    @GetMapping("/vehicules/{id}")
    public ResponseEntity<?> getVehiculeById(@PathVariable Long id, @RequestParam String key) throws Exception {
        if(jwtUtil.isValidToken(key)){
            return ResponseEntity.ok(vehiculeService.getVehiculeById(id));
        }else return ResponseEntity.badRequest().body("Invalid token");
    }

    @PostMapping("/vehicules")
    public ResponseEntity<?> saveVehicule(@RequestBody Vehicule vehicule, @RequestParam String key) throws Exception {
        if (jwtUtil.isValidToken(key)){
            return ResponseEntity.ok(vehiculeService.saveVehicule(vehicule));
        }else return ResponseEntity.badRequest().body("Invalid token");
    }

    @DeleteMapping("/vehicules/{id}")
    public ResponseEntity<?> deletVehiculebyId(@PathVariable Long id, @RequestParam String key) throws Exception {
        if(jwtUtil.isValidToken(key)){
            vehiculeService.deletVehiculeById(id);
            return ResponseEntity.ok("vehicule n°"+id+"has been deleted");
        }else return ResponseEntity.badRequest().body("Invalid token");
    }
}
