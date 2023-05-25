package com.lifat.CircuitsCourtsApi.service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.fge.jsonpatch.JsonPatch;
import com.github.fge.jsonpatch.JsonPatchException;
import com.lifat.CircuitsCourtsApi.model.*;
import com.lifat.CircuitsCourtsApi.repository.*;
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

    @Autowired
    private ClientRepository clientRepository;

    @Autowired
    private CommandeDetailService commandeDetailService;

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


    //TODO : verif proncipale

    /**
     * verifie l'existence du client, des producteurs et des produits
     * verifie pour chaque commandeProducteur si stock producteur >= commandeProducteur quantite
     * verifie que la quantite de la commandeDetail == somme des quantitees des commandesProd associees
     * verifie pour chaque producteur qu'il sont dans leurs rayon de livraison respectif
     *
     * @param commandeInfo
     * @return boolean si la commandeInfo est valide
     */
    public boolean verifCommandeInfo(CommandeInfo commandeInfo) throws Exception {
        if (!commandeRepository.existsById(commandeInfo.getCommande().getId())) {
            //verification de l'existence du client
            if (doesClientExist(commandeInfo.getCommande().getIdClient())) {
                //verification de l'existence des produits
                Collection<CommandeDetail> commandesDetails = commandeInfo.getCommandesDetails();
                for (CommandeDetail cc : commandesDetails) {
                    doesCommandeDetailExist(cc.getId());
                    doesProduitExist(cc.getIdProduit());
                }
                //verification de l'existence de chaque producteurs affectés à la commande et si leurs stock >= quantite commandeProd
                Collection<CommandeProducteur> commandesProd = commandeInfo.getCommandesProducteur();
                for (CommandeProducteur cp : commandesProd) {
                    doesCommandeProdExist(cp.getId());
                    doesProducteurExist(cp.getIdProducteur());
                    Optional<CommandeDetail> commandesDetail = commandeDetailService.getCommandeDetail(cp.getIdCommandeDetails());
                    if (commandesDetail.isPresent()) {
                        doesPorducteurHaveEnough(cp.getIdProducteur(), commandesDetail.get().getIdProduit(), cp.getQuantite());
                    }
                    return false;
                }
            }
           return false;
        }
        throw new Exception("La commande n°" + commandeInfo.getCommande().getId() + " existe déjà");
    }

    /**
     * Verifie que le producteur existe bien.
     *
     * @param idProducteur le producteur
     * @return true si le producteur existe.
     */
    public boolean doesProducteurExist(Long idProducteur) throws Exception {
        if (producteurRepository.findById(idProducteur).isPresent()) {
            return true;
        } else throw new Exception("Le producteur n°" + idProducteur + " n'existe pas");
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
     * @param //qte        la quantité voulu du produit.
     * @return une liste contenant le ou les producteurs qui satisfont la commande.
     * <p>
     * public Collection<Optional<Producteur>> validationProduitForProducteur(Long idProduit, Long idProducteur, Long qte) throws Exception {
     * Optional<Producteur> producteur = producteurRepository.findById(idProducteur);
     * //verifie si l'objet Optinal<Producteur> existe, si oui on cherche le produit chez le producteur
     * if (producteur.isPresent()) {
     * Collection<Optional<Producteur>> producteurs = new ArrayList<>();
     * Optional<Produit> p = produitRepository.findProduitByIdProduitAndProducteur(idProducteur, idProduit);
     * //si ce producteur possede un quantite suffisante du produit alors il est le seul dans la liste.
     * if (p.isPresent() && getQuantiteByProduitId(idProduit, idProducteur) >= qte) {
     * producteurs.add(producteur);
     * //si le producteur ne possede pas une quantite suffisante du produit.
     * } else if (getQuantiteByProduitId(idProduit, idProducteur) < qte) {
     * Collection<Producteur> producteursCandidat = producteurRepository.findAllByProduit(idProduit);
     * float quantiteActuelle = 0;
     * for (Producteur producteurCandidat : producteursCandidat) {
     * quantiteActuelle += produitRepository.fintQteByProduitAndProducteurs(producteurCandidat.getId_Producteur(), idProduit);
     * if (quantiteActuelle >= qte) break;
     * }
     * return producteurs;
     * }
     * }
     * throw new Exception("Pas assez de producteurs pou satisfaire la commande");
     * }
     */

    //recupere la quantité possédée par un producteur d'un produit
    public float getQuantiteByProduitId(Long idProduit, Long idProducteur) {
        return produitRepository.fintQteByProduitAndProducteurs(idProducteur, idProduit);
    }


    //sprint 2
    //TODO : verifie que la date de la commande < date livraison de tournee.
    public void verifDate() {

    }

    public boolean doesClientExist(Long idClient) throws Exception {
        if (clientRepository.findById(idClient).isPresent()) {
            return true;
        } else throw new Exception("Le client n°" + idClient + " n'existe pas");
    }

    public boolean doesProduitExist(Long idProduit) throws Exception {
        if (produitRepository.findById(idProduit).isPresent()) {
            return true;
        } else throw new Exception("Le produit n°" + idProduit + " n'existe pas");
    }


    //TODO : verification que le rayon de livraison du ou des producteur > distance producteurs/Client.
    public boolean doesProducteurCanDelivery(Float rayonLivraison, Float distance) {
        return false;
    }

    public boolean doesPorducteurHaveEnough(Long idproducteur, Long idProduit, Float quantite) throws Exception {
        System.out.println(produitRepository.findProduitsByProducteur(idproducteur).toString());
        if (!produitRepository.findProduitsByProducteur(idProduit).isEmpty()) {
            Optional<Float> optionalQte = producteurRepository.getQteProduit(idproducteur, idProduit);
            if (optionalQte.isPresent() && optionalQte.get() >= quantite) {
                return true;
            } else
                throw new Exception("le producteur n°" + idproducteur + " n'a pas le produit n°" + idProduit + " en quantite suffiante");
        } else
            throw new Exception("Le producteur n°" +idproducteur+ " : "+ producteurRepository.findById(idproducteur).get().getLibelle()+" ne possede pas le produit n°" + idProduit + " : " + produitRepository.findById(idProduit).get().getLibelle());
    }

    @Autowired
    private CommandeProducteurRepository commandeProducteurRepository;

    @Autowired
    private CommandeDetailRepository commandeDetailRepository;
    public boolean doesCommandeProdExist(Long idCommandeProd) throws Exception {
        if(!commandeProducteurRepository.existsById(idCommandeProd)){
           return true;
        }
        else throw new Exception("La commandeProducteur n°"+ idCommandeProd+" existe deja");
    }

    public boolean doesCommandeDetailExist(Long idCommandeDetail) throws Exception {
        if(!commandeDetailRepository.existsById(idCommandeDetail)){
            return true;
        }
        else throw new Exception("La commandeDetail n°" + idCommandeDetail + " existe deja");
    }
}
