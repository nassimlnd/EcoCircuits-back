package com.lifat.CircuitsCourtsApi.controller;

import com.lifat.CircuitsCourtsApi.JWTEndPointsProtection.JwtUtil;
import com.lifat.CircuitsCourtsApi.model.Producteur;
import com.lifat.CircuitsCourtsApi.service.ProducteurServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

@CrossOrigin(origins = "http://localhost:3000")
@RequestMapping("/api")
@RestController
public class ProducterController {
    @Autowired
    JwtUtil jwtUtil;
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
    public void deletProducteurById(@PathVariable Long id) {
        producteurServices.deletProducteurById(id);
    }

}
