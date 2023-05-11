package com.lifat.CircuitsCourtsApi.controller;

import com.lifat.CircuitsCourtsApi.JWTEndPointsProtection.JwtUtil;
import com.lifat.CircuitsCourtsApi.model.Producteur;
import com.lifat.CircuitsCourtsApi.service.ProducteurServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
@CrossOrigin(origins = "http://localhost:3000")
@RequestMapping("/api")
@RestController
public class ProducterController {
    @Autowired
    JwtUtil jwtUtil;
    @Autowired
    private ProducteurServices producteurServices;

    @GetMapping("/producteurs")
    public Iterable<Producteur> getAllProducteurs(@RequestParam String key) throws Exception {
        if(jwtUtil.isValidToken(key)){
            return producteurServices.getAllProducteurs();
        }else {
            throw new Exception("Invalid Token");
        }
    }

    @GetMapping("/producteurs/{id}")
    public Producteur getProducteurById(@PathVariable Long id, @RequestParam String key) throws Exception {
        if(jwtUtil.isValidToken(key)){
            return producteurServices.getProducteurById(id);
        }else {
            throw new Exception("Invalid Token");
        }
    }

    @PostMapping("/producteurs")
    public Producteur saveProducteur(@RequestBody Producteur producteur, @RequestParam String key) throws Exception {
        if(jwtUtil.isValidToken(key)){
            return producteurServices.saveProducteur(producteur);
        }else {
            throw new Exception("Invalid Token");
        }
    }

    @DeleteMapping("/producteurs/{id}")
    public void deletProducteurById(@PathVariable Long id, @RequestParam String key) throws Exception {
        if(jwtUtil.isValidToken(key)){
            producteurServices.deletProducteurById(id);
        }else {
            throw new Exception("Invalid Token");
        }
    }

}
