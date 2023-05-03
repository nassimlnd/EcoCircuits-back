package com.lifat.CircuitsCourtsApi.controller;


import com.lifat.CircuitsCourtsApi.model.Producteur;
import com.lifat.CircuitsCourtsApi.service.ProducteurServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RequestMapping("/api")
@RestController
public class ProducterController {
    @Autowired
    private ProducteurServices producteurServices;

    @GetMapping("/producteurs")
    public Iterable<Producteur> getAllProducteurs(){
        return producteurServices.getAllProducteurs();
    }

    @GetMapping("/producteurs/{id}")
    public Producteur getProducteurById(long id) {
        return producteurServices.getProducteurById(id);
    }

    @PostMapping("/producteurs")
    public Producteur saveProducteur(@RequestBody Producteur producteur){
        return producteurServices.saveProducteur(producteur);
    }

    @DeleteMapping("/producteurs/{id}")
    public void deletProducteurById(@PathVariable Long id){
        producteurServices.deletProducteurById(id);
    }

}
