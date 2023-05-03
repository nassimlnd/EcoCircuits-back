package com.lifat.CircuitsCourtsApi.service;

import com.lifat.CircuitsCourtsApi.model.Produit;
import com.lifat.CircuitsCourtsApi.repository.ProduitRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ProduitService {

    @Autowired
    private ProduitRepository produitRepository;

    public Iterable<Produit> getProduits() {
        return produitRepository.findAll();
    }

    public Produit saveProduit(Produit produit) {
        Produit savedProduit = produitRepository.save(produit);
        return savedProduit;
    }

    public Produit getProduit(final Long id) {
        return produitRepository.findById(id).get();
    }

    public void deleteProduit(final Long id) {
        produitRepository.deleteById(id);
    }

}
