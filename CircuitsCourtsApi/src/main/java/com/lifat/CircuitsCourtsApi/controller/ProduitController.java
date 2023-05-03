package com.lifat.CircuitsCourtsApi.controller;

import com.lifat.CircuitsCourtsApi.model.Produit;
import com.lifat.CircuitsCourtsApi.service.ProduitService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api")
public class ProduitController {

    @Autowired
    private ProduitService produitService;

    @GetMapping("/produits")
    public Iterable<Produit> getProduits() {
        return produitService.getProduits();
    }

    @PostMapping("/produits")
    public Produit saveProduit(Produit produit) {
        return produitService.saveProduit(produit);
    }

    @DeleteMapping("/produits/{id}")
    public void deleteProduit(@PathVariable Long id) {
        produitService.deleteProduit(id);
    }

}
