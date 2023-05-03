package com.lifat.CircuitsCourtsApi.controller;


import com.lifat.CircuitsCourtsApi.model.Producteur;
import com.lifat.CircuitsCourtsApi.service.ProducteurServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.rest.webmvc.ResourceNotFoundException;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

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
    public Producteur getProducteurById(@PathVariable long id) {
        return producteurServices.getProducteurById(id);
    }




}
