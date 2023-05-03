package com.lifat.CircuitsCourtsApi.controller;

import com.lifat.CircuitsCourtsApi.model.Produit;
import com.lifat.CircuitsCourtsApi.service.ProduitService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
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

    @DeleteMapping("/produits")
    public void deleteProduit(Long id) {
        produitService.deleteProduit(id);
    }

}
