package com.lifat.CircuitsCourtsApi.controller;

import com.lifat.CircuitsCourtsApi.model.Producteur;
import com.lifat.CircuitsCourtsApi.service.ProducteurServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

@CrossOrigin(origins = "http://localhost:3000")
@RequestMapping("/api")
@RestController
public class ProducterController {

    @Autowired
    private ProducteurServices producteurServices;

    @PreAuthorize("hasRole('ADMIN') or hasRole('ORGANISATEUR')")
    @GetMapping("/producteurs")
    public Iterable<Producteur> getAllProducteurs() {
        return producteurServices.getAllProducteurs();
    }

    @PreAuthorize("hasRole('ADMIN') or hasRole('ORGANISATEUR')")
    @GetMapping("/producteurs/{id}")
    public Producteur getProducteurById(@PathVariable Long id) {
        return producteurServices.getProducteurById(id);
    }

    @PreAuthorize("hasRole('ADMIN') or hasRole('ORGANISATEUR')")
    @PostMapping("/producteurs")
    public Producteur saveProducteur(@RequestBody Producteur producteur) {
        return producteurServices.saveProducteur(producteur);
    }

    @PreAuthorize("hasRole('ADMIN') or hasRole('ORGANISATEUR')")
    @DeleteMapping("/producteurs/{id}")
    public ResponseEntity<Object> deletProducteurById(@PathVariable Long id)throws Exception {
        if (producteurServices.getProducteurById(id) == null) {
            throw new Exception("le producteur n°" + id + " does not exist");
        }
        producteurServices.deletProducteurById(id);
        //envoi d'une reponse status 204 pour indiquer que la ressource à été supprimée avec succes.
        return ResponseEntity.noContent().build();
    }

}
