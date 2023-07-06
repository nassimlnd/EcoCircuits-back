package com.lifat.CircuitsCourtsApi.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.github.fge.jsonpatch.JsonPatch;
import com.github.fge.jsonpatch.JsonPatchException;
import com.lifat.CircuitsCourtsApi.model.Produit;
import com.lifat.CircuitsCourtsApi.service.ProduitService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.sql.SQLOutput;
import java.util.Collection;
import java.util.Optional;

@CrossOrigin(origins = "http://localhost:3000")
@RestController
@RequestMapping("/api")
public class ProduitController {

    @Autowired
    private ProduitService produitService;

    @GetMapping("/produits/{id}")
    public ResponseEntity<?> getProduitById(@PathVariable Long id){
        Optional<Produit> existingProduct= produitService.getProduit(id);
        if(existingProduct.isEmpty()){
            return ResponseEntity.badRequest().body("le produit n°" + id + " n'existe pas");
        }

        return ResponseEntity.ok().body(produitService.getProduit(id).get());
    }


    /**
     * Envoi de tous les produits
     * @return tous les produits de la bd
     */
    @PreAuthorize("hasRole('ADMIN') or hasRole('ORGANISATEUR')")
    @GetMapping("/produits")
    public ResponseEntity<?> getProduits() {
        return ResponseEntity.ok(produitService.getProduits());
    }

    /**
     * Enregistre un produit dans la bd
     * @param produit
     * @return le produit enregistré
     */
    @PreAuthorize("hasRole('ADMIN') or hasRole('ORGANISATEUR')")
    @PostMapping("/produits")
    public ResponseEntity<?> saveProduit(@RequestBody Produit produit) {
        return ResponseEntity.ok(produitService.saveProduit(produit));
    }

    /**
     * Supprime un produit
     * @param id du produit a supprimer
     * @return Http status 204
     */
    @DeleteMapping("/produits/{id}")
    public ResponseEntity<?> deleteProduit(@PathVariable Long id) {
        Optional<Produit> produit = produitService.getProduit(id);
        if(produit.isEmpty()){
            ResponseEntity.badRequest().body("le produit n°" + id + "n'existe pas");
        }
        produitService.deleteProduit(id);
        return ResponseEntity.noContent().build();
    }


    /**
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


    /**
     * update un produit avec in patch(update partielle)
     * @param id id du produit
     * @param  patch a appliquer
     * @return renvoi le produit patché
     * @throws JsonPatchException
     * @throws JsonProcessingException
     */
    @PreAuthorize("hasRole('ADMIN') or hasRole('ORGANISATEUR') or hasRole ('PRODUCTEUR')")
    @PatchMapping(path = "/produits/{id}", consumes  = "application/json-patch+json")
    public ResponseEntity<?> updateProduit(@PathVariable Long id, @RequestBody JsonPatch patch) throws JsonPatchException, JsonProcessingException {
        Optional<Produit> existingProduit = produitService.getProduit(id);
        if(existingProduit.isEmpty()){
            return ResponseEntity.badRequest().body("le produit n°" +id+" n'existe pas.");
        }

        Produit updateProduit = produitService.applyPatchToProduit(patch, existingProduit);
        produitService.saveProduit(updateProduit);
        return ResponseEntity.ok().body(updateProduit);
    }

}
