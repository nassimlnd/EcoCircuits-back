package com.lifat.CircuitsCourtsApi.controller;

import com.lifat.CircuitsCourtsApi.model.Produit;
import com.lifat.CircuitsCourtsApi.service.ProduitService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.Collection;

@CrossOrigin(origins = "http://localhost:3000")
@RestController
@RequestMapping("/api")
public class ProduitController {

    @Autowired
    private ProduitService produitService;


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


    /***
     * Premet d'envoyer les produits d'un seul producteur
     * @param id correspond à l'id du producteur
     * @return les produit du producteur en question
     */
    @PreAuthorize("hasRole('ADMIN') or hasRole('ORGANISATEUR') or hasRole ('PRODUCTEUR')")
    @GetMapping("/produits/producteur/{id}")
    public ResponseEntity<Collection<Produit>> getProduitsByProducteurs(@PathVariable Long id){
        Collection<Produit> produits =  produitService.getProduitsByProducteur(id);
        return ResponseEntity.ok().body(produits);
    }

}
