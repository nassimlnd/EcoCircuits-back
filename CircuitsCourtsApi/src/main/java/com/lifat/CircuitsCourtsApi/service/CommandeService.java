package com.lifat.CircuitsCourtsApi.service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.fge.jsonpatch.JsonPatch;
import com.github.fge.jsonpatch.JsonPatchException;
import com.lifat.CircuitsCourtsApi.model.Commande;
import com.lifat.CircuitsCourtsApi.model.Producteur;
import com.lifat.CircuitsCourtsApi.model.Produit;
import com.lifat.CircuitsCourtsApi.repository.CommandeRepository;
import com.lifat.CircuitsCourtsApi.repository.ProducteurRepository;
import com.lifat.CircuitsCourtsApi.repository.ProduitRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Optional;

@Service
public class CommandeService {

    @Autowired
    private CommandeRepository commandeRepository;

    @Autowired
    private ProducteurRepository producteurRepository;

    @Autowired
    private ProduitRepository produitRepository;

    public Iterable<Commande> getCommandes() {
        return commandeRepository.findAll();
    }

    public Commande saveCommande(Commande commande) {
        Commande savedCommande = commandeRepository.save(commande);
        return savedCommande;
    }

    public Optional<Commande> getCommande(final Long id) {
        return commandeRepository.findById(id);
    }

    public void deleteCommande(final Long id) {
        commandeRepository.deleteById(id);
    }

    public Iterable<Commande> getCommandesByClientId(Long id) {
        return commandeRepository.findByIdClient(id);
    }


    public Iterable<Commande> getAllCommandesByProd(Long id) {
        return commandeRepository.findAllCommandesByProducteur(id);
    }

    @Autowired
    private ObjectMapper objectMapper;

    /***
     *  modifie la commande voulu en fonction du JsonPatch
     *  modification partielle de la commande
     * @param patch Json patch recupéré dans le controller
     * @param targetCommande
     * @return la nouvelle commande
     * @throws JsonPatchException
     * @throws JsonProcessingException
     */
    public Commande applyPatchToCommande(JsonPatch patch, Commande targetCommande) throws JsonPatchException, JsonProcessingException {
        JsonNode patched = patch.apply(objectMapper.convertValue(targetCommande, JsonNode.class));
        return objectMapper.treeToValue(patched, Commande.class);
    }

    // -------------------- verification de la commande --------------------


    //TODO : apeller toutes les autres méthodes de verif pour etablire la verification complète de la commande.
    public boolean doesProductCanFillThisCommande(Long idProduit, Long idProducteur, Long qte) {

        return false;
    }

    /**
     * Verifie que le producteur existe bien.
     * @param idProducteur le producteur
     * @return true si le producteur existe.
     */
    public boolean doesProducteurExist(Long idProducteur) {
        Optional<Producteur> producteur = producteurRepository.findById(idProducteur);
        //verifie si l'objet Optinal<Producteur> existe, si oui on cherche le produit chez le producteur
        if (producteur.isPresent()) {
            return true;
        } else return false;
    }

    //TODO : dans le cas ou plusieurs producteurs completent une commande il faut les trier du plus proche au plus loin du producteur initial.
    /**
     * Verifie que le producteur à bien le produit voulu avec assez de stock.
     * si le producteur de possede pas une quantite suffisante du produit alors
     * on cherche tous les producteurs qui produisent ce produit et on les ajoutes dans la liste jusqu'a ce que
     * la somme de leurs qantitées respectives du produit soit suffisante pour satisfaire la commande.
     *
     * @param idProduit    le produit voulu.
     * @param idProducteur le producteur voulu.
     * @param qte          la quantité voulu du produit.
     * @return une liste contenant le ou les producteurs qui satisfont la commande.
     */
    public Collection<Optional<Producteur>> validationProduitForProducteur(Long idProduit, Long idProducteur, Long qte) throws Exception {
        Optional<Producteur> producteur = producteurRepository.findById(idProducteur);
        //verifie si l'objet Optinal<Producteur> existe, si oui on cherche le produit chez le producteur
        if (producteur.isPresent()) {
            Collection<Optional<Producteur>> producteurs = new ArrayList<>();
            Optional<Produit> p = produitRepository.findProduitByIdProduitAndProducteur(idProducteur, idProduit);
            //si ce producteur possede un quantite suffisante du produit alors il est le seul dans la liste.
            if (p.isPresent() && getQuantiteByProduitId(idProduit, idProducteur) >= qte) {
                producteurs.add(producteur);
                //si le producteur ne possede pas une quantite suffisante du produit.
            } else if (getQuantiteByProduitId(idProduit, idProducteur) < qte) {
                Collection<Producteur> producteursCandidat = producteurRepository.findAllByProduit(idProduit);
                float quantiteActuelle = 0;
                for (Producteur producteurCandidat : producteursCandidat) {
                    quantiteActuelle += produitRepository.fintQteByProduitAndProducteurs(producteurCandidat.getId_Producteur(), idProduit);
                    if (quantiteActuelle >= qte) break;
                }
                return producteurs;
            }
        }
        throw new Exception("Pas assez de producteurs pou satisfaire la commande");
    }


    //recupere la quantité possédée par un producteur d'un produit
    public float getQuantiteByProduitId(Long idProduit, Long idProducteur) {
        return produitRepository.fintQteByProduitAndProducteurs(idProducteur, idProduit);
    }


    //sprint 2
    //TODO : verifie que la date de la commande < date livraison.
    public void verifDate(){

    }

    //TODO : verifie que le client existe bien.
    public void verifClient(){

    }

}
