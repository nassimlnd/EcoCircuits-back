package com.lifat.CircuitsCourtsApi.controller;

import com.lifat.CircuitsCourtsApi.JWTEndPointsProtection.JwtUtil;
import com.lifat.CircuitsCourtsApi.model.Produit;
import com.lifat.CircuitsCourtsApi.service.ProduitService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

@CrossOrigin(origins = "http://localhost:3000")
@RestController
@RequestMapping("/api")
public class ProduitController {

    @Autowired
    private ProduitService produitService;

    @Autowired
    private JwtUtil jwtUtil;

    @PreAuthorize("hasRole('ADMIN') or hasRole('ORGANISATEUR')")
    @GetMapping("/produits")
    public ResponseEntity<?> getProduits() {
        return ResponseEntity.ok(produitService.getProduits());
    }

    @PreAuthorize("hasRole('ADMIN') or hasRole('ORGANISATEUR')")
    @PostMapping("/produits")
    public ResponseEntity<?> saveProduit(@RequestBody Produit produit) {
        return ResponseEntity.ok(produitService.saveProduit(produit));
    }

    @DeleteMapping("/produits/{id}")
    public ResponseEntity<?> deleteProduit(@PathVariable Long id) {
        produitService.deleteProduit(id);
        return ResponseEntity.ok("Produit with id " + id + " has been deleted.");
    }

}
