package com.lifat.CircuitsCourtsApi.controller;

import com.lifat.CircuitsCourtsApi.JWTEndPointsProtection.JwtUtil;
import com.lifat.CircuitsCourtsApi.model.Produit;
import com.lifat.CircuitsCourtsApi.service.ProduitService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
@CrossOrigin(origins = "http://localhost:3000")
@RestController
@RequestMapping("/api")
public class ProduitController {

    @Autowired
    private ProduitService produitService;

    @Autowired
    private JwtUtil jwtUtil;

    @GetMapping("/produits")
    public ResponseEntity<?> getProduits(@RequestParam String key) throws Exception {
        if(jwtUtil.isValidToken(key)){
            return ResponseEntity.ok(produitService.getProduits()) ;
        }else return ResponseEntity.badRequest().body("Invalid Token");
    }

    @PostMapping("/produits")
    public ResponseEntity<?> saveProduit(@RequestBody Produit produit, @RequestParam String key) throws Exception {
        if(jwtUtil.isValidToken(key)){
            return ResponseEntity.ok(produitService.saveProduit(produit));
        }else return ResponseEntity.badRequest().body("Invalid Token");
    }

    @DeleteMapping("/produits/{id}")
    public ResponseEntity<?> deleteProduit(@PathVariable Long id, @RequestParam String key) throws Exception {
        if(jwtUtil.isValidToken(key)){
            produitService.deleteProduit(id);
            return ResponseEntity.ok("Produit with id " + id + " has been deleted.");
        }else return ResponseEntity.badRequest().body("Invalid Token");
    }

}
