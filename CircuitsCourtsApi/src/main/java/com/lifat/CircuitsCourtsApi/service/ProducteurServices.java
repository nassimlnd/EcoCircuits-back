package com.lifat.CircuitsCourtsApi.service;

import com.lifat.CircuitsCourtsApi.model.Producteur;
import com.lifat.CircuitsCourtsApi.repository.ProducteurRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Collection;
import java.util.Optional;

@Service
public class ProducteurServices {
    @Autowired
    private ProducteurRepository producteurRepository;

    public Iterable<Producteur> getAllProducteurs(){
        return producteurRepository.findAll();
    }

    public Optional<Producteur> getProducteurById(Long id){
        return producteurRepository.findById(id);
    }

    public Producteur saveProducteur(Producteur producteur){
        Producteur  savedProducteur = producteurRepository.save(producteur);
        return savedProducteur;
    }

    public void deletProducteurById(Long id){
        producteurRepository.deleteById(id);
    }

    public Collection<Producteur> getAllProducteurdByProduits(Long idProduit){
        return producteurRepository.findAllByProduit(idProduit);
    }


    public Optional<Float> getQteProduit(Long idProd, Long idProduit){
        return producteurRepository.getQteProduit(idProd, idProduit);
    }
    public void updateQteProduit(Long idProd, Long idProduit, Float qte){
        producteurRepository.updateQteProduit(idProd, idProduit, qte);
    }
}
