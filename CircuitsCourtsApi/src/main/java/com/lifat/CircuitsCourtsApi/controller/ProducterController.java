package com.lifat.CircuitsCourtsApi.controller;

import com.lifat.CircuitsCourtsApi.model.Producteur;
import com.lifat.CircuitsCourtsApi.model.Produit;
import com.lifat.CircuitsCourtsApi.service.ProducteurServices;
import com.lifat.CircuitsCourtsApi.service.ProduitService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.Optional;

@CrossOrigin(origins = "http://localhost:3000")
@RequestMapping("/api")
@RestController
public class ProducterController {

    @Autowired
    private ProducteurServices producteurServices;

    @Autowired
    private ProduitService produitService;

    @PreAuthorize("hasRole('ADMIN') or hasRole('ORGANISATEUR')")
    @GetMapping("/producteurs")
    public Iterable<Producteur> getAllProducteurs() {
        return producteurServices.getAllProducteurs();
    }

    @PreAuthorize("hasRole('ADMIN') or hasRole('ORGANISATEUR')")
    @GetMapping("/producteurs/{id}")
    public ResponseEntity<?> getProducteurById(@PathVariable Long id) {
        Optional<Producteur> existingProducteur = producteurServices.getProducteurById(id);
        if(existingProducteur.isEmpty()){
            return ResponseEntity.badRequest().body("le producteur n°" + id + " n'existe pas.");
        }
        return ResponseEntity.ok().body( producteurServices.getProducteurById(id));
    }

    @PreAuthorize("hasRole('ADMIN') or hasRole('ORGANISATEUR')")
    @PostMapping("/producteurs")
    public ResponseEntity<?> saveProducteur(@RequestBody Producteur producteur) {
        return ResponseEntity.ok().body(producteurServices.saveProducteur(producteur)) ;
    }

    @PreAuthorize("hasRole('ADMIN') or hasRole('ORGANISATEUR')")
    @DeleteMapping("/producteurs/{id}")
    public ResponseEntity<?> deletProducteurById(@PathVariable Long id)throws Exception {
        Optional<Producteur> existingProducteur = producteurServices.getProducteurById(id);
        if(existingProducteur.isEmpty()){
            return ResponseEntity.badRequest().body("le producteur n°" + id + " n'existe pas.");
        }
        producteurServices.deletProducteurById(id);
        //envoi d'une reponse status 204 pour indiquer que la ressource à été supprimée avec succes.
        return ResponseEntity.noContent().build();
    }


    /**
     * Renvoi tous les producteurs qui produisent ce produit
     * @param idProduit le produit
     * @return la liste des producteurs
     */
    @PreAuthorize("hasRole('ADMIN') or hasRole('ORGANISATEUR')")
    @GetMapping("/producteurs/produit/{idProduit}")
    public ResponseEntity<?> getProdByProduits(@PathVariable Long idProduit){
        Optional<Produit> existingProduit = produitService.getProduit(idProduit);
        if(existingProduit.isEmpty()){
            return ResponseEntity.badRequest().body("le produit n°" + idProduit + " n'existe pas");
        }
        return ResponseEntity.ok().body(producteurServices.getAllProducteurdByProduits(idProduit));
    }

}
