package com.lifat.CircuitsCourtsApi.service;

import com.lifat.CircuitsCourtsApi.model.ProduitProducteurId;
import com.lifat.CircuitsCourtsApi.model.ProduitsProducteurs;
import com.lifat.CircuitsCourtsApi.repository.ProduitProducteurRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class ProduitProducteurService {

    @Autowired
    private ProduitProducteurRepository produitProducteurRepository;

    public Optional<ProduitsProducteurs> getById(ProduitProducteurId id){
        return produitProducteurRepository.findById(id);
    }

    public ProduitsProducteurs save(ProduitsProducteurs produitsProducteurs){
        return produitProducteurRepository.save(produitsProducteurs);
    }

}
