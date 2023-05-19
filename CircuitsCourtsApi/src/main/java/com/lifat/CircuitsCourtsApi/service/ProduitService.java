package com.lifat.CircuitsCourtsApi.service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.fge.jsonpatch.JsonPatch;
import com.github.fge.jsonpatch.JsonPatchException;
import com.lifat.CircuitsCourtsApi.model.Commande;
import com.lifat.CircuitsCourtsApi.model.Produit;
import com.lifat.CircuitsCourtsApi.repository.ProduitRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Collection;

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

    public Collection<Produit> getProduitsByProducteur(Long idProducteur){
        return produitRepository.findProduitsByProducteur(idProducteur);
    }

    @Autowired
    private ObjectMapper objectMapper;
    public Produit applyPatchToProduit(JsonPatch patch, Produit targetProduit) throws JsonPatchException, JsonProcessingException {
        JsonNode patched = patch.apply(objectMapper.convertValue(targetProduit, JsonNode.class));
        return objectMapper.treeToValue(patched, Produit.class);
    }
}
