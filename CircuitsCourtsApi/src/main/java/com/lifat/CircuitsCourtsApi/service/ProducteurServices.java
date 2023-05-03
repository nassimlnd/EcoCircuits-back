package com.lifat.CircuitsCourtsApi.service;

import com.lifat.CircuitsCourtsApi.model.Producteur;
import com.lifat.CircuitsCourtsApi.repository.ProducteurRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.rest.webmvc.ResourceNotFoundException;
import org.springframework.stereotype.Service;

@Service
public class ProducteurServices {
    @Autowired
    private ProducteurRepository producteurRepository;

    public Iterable<Producteur> getAllProducteurs(){
        return producteurRepository.findAll();
    }

    public Producteur getProducteurById(Long id){
        return producteurRepository.findById(id).get();
    }

    public Producteur saveProducteur(Producteur producteur){
        Producteur  savedProducteur = producteurRepository.save(producteur);
        return savedProducteur;
    }

    public void deletProducteurById(Long id){
        producteurRepository.deleteById(id);
    }
}
