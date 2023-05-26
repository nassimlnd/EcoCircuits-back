package com.lifat.CircuitsCourtsApi.service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.fge.jsonpatch.JsonPatch;
import com.github.fge.jsonpatch.JsonPatchException;
import com.lifat.CircuitsCourtsApi.model.*;
import com.lifat.CircuitsCourtsApi.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.config.web.servlet.oauth2.resourceserver.OpaqueTokenDsl;
import org.springframework.stereotype.Service;

import java.util.*;

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

    /**
     * Les verifications sont utiles pour la création d'une commande
     * verifie l'existence du client, des producteurs et des produits
     * verifie pour chaque commandeProducteur si stock producteur >= commandeProducteur quantite
     * verifie que la quantite de la commandeDetail == somme des quantitees des commandesProd associees
     * verifie pour chaque producteur qu'il sont dans leurs rayon de livraison respectif
     *
     * @param commandeInfo
     * @return treu si et seulement si  aucunes verificatipns de la commandeInfo n'ont levees aucunes une exception
     */
    public boolean verifCommandeInfo(CommandeInfo commandeInfo) throws Exception {
        //on verifie que la commande n'existe pas deja

        commandeExist(commandeInfo.getCommande().getId());
        //verification de l'existence du client
        Commande newCommande = commandeInfo.getCommande();
        //System.out.println(commandeInfo.getCommande().toString());
        //System.out.println("===================" + newCommande.getIdClient());
        //System.out.println("===================" + clientRepository.findById(newCommande.getIdClient()));
        if (doesClientExist(newCommande.getIdClient())) {
            //verification de l'existence des produits

            HashMap<CommandeDetail, ArrayList<CommandeProducteur>> hashVerif = getCommandesProducteurByCommandeDetail(commandeInfo);
            for (Map.Entry mapEntry : hashVerif.entrySet()) {
                CommandeDetail cd = (CommandeDetail) mapEntry.getKey();
                //System.out.println(cd.toString());
                doesCommandeDetailExist(cd.getId());
                doesProduitExist(cd.getIdProduit());
                cd.setIdCommande(newCommande.getId());

                //verifications pour les commandes prod associées à cette commande detail.
                //verification de l'existence de chaque producteurs affectés à la commande et si leurs stock >= quantite commandeProd
                ArrayList<CommandeProducteur> commandesProd = (ArrayList<CommandeProducteur>) mapEntry.getValue();
                for (CommandeProducteur cp : commandesProd) {
                    //System.out.println(cp.toString());
                    doesCommandeProdExist(cp.getId());
                    doesProducteurExist(cp.getIdProducteur());
                    if (doesPorducteurHaveEnough(cp.getIdProducteur(), cd.getIdProduit(), cp.getQuantite())) {
                        producteurRepository.updateQteProduit(cp.getIdProducteur(), cd.getIdProduit(), cp.getQuantite());
                    }
                }
            }
        }
        return true;
    }


    /**
     * verifie que la commande n'existe pas dans la base de données
     *
     * @param id
     * @return true si la commande n'existe pas
     * @throws Exception si la commande existe deja
     */
    public boolean commandeExist(Long id) throws Exception {
        if (commandeRepository.findById(id).isEmpty()) {
            return true;
        } else throw new Exception("La commande n°" + id + "existe  deja");
    }


    /**
     * Récupere toutes les commandesProd et commandesDetail de la commandeInfo pour les mettre trier via une
     * hasmap<CommandeDetail, ArrayList<CommandeProducteur>>, cela permet d'associer a chaque commandeDetail les commandeProducteur
     * correspondentes.
     *
     * @param commandeInfo
     * @return HashMap<CommandeDetail, ArrayList < CommandeProducteur>>
     */
    public HashMap<CommandeDetail, ArrayList<CommandeProducteur>> getCommandesProducteurByCommandeDetail(CommandeInfo commandeInfo) {
        HashMap resultHashMap = new HashMap();
        Collection<CommandeDetail> commandeDetails = commandeInfo.getCommandesDetails();
        for (CommandeDetail cd : commandeDetails) {
            Long id = cd.getId();
            ArrayList<CommandeProducteur> commandeProducteurs = new ArrayList<>();
            //pour chaque commandeDetail on crée une arrayList<CommandeProducteur>.
            for (CommandeProducteur cp : commandeInfo.getCommandesProducteur()) {
                //si la commandeProducteur à un idCommandeDetail = l'id de la CommandeDetail on la met dans l'arrayList
                if (Objects.equals(cp.getIdCommandeDetails(), id)) {
                    commandeProducteurs.add(cp);
                }

                resultHashMap.put(cd, commandeProducteurs);
            }
        }
        return resultHashMap;
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

    /**
     * recupere la quantité possédée par un producteur d'un produit
     *
     * @param idProduit
     * @param idProducteur
     * @return float quantite
     */

    public float getQuantiteByProduitId(Long idProduit, Long idProducteur) {
        return produitRepository.fintQteByProduitAndProducteurs(idProducteur, idProduit);
    }


    //sprint 2
    //TODO : verifie que la date de la commande < date livraison de tournee.
    public void verifDate() {


    }

    /**
     * Verifie que le client existe dans la base de donnees
     *
     * @param idClient
     * @return true si le client exist
     * @throws Exception si le client n'existe pas.
     */
    public boolean doesClientExist(Long idClient) throws Exception {
        if (clientRepository.findById(idClient).isPresent()) {
            return true;
        } else throw new Exception("Le client n°" + idClient + " n'existe pas");
    }

    /**
     * Verifie que le produit existe dans la base de donnees
     *
     * @param idProduit
     * @return true si le produit existe
     * @throws Exception si le produit n'existe pas
     */
    public boolean doesProduitExist(Long idProduit) throws Exception {
        if (produitRepository.findById(idProduit).isPresent()) {
            return true;
        } else throw new Exception("Le produit n°" + idProduit + " n'existe pas");
    }


    //TODO : verification que le rayon de livraison du ou des producteur > distance producteurs/Client.
    public boolean doesProducteurCanDelivery(Float rayonLivraison, Float distance) {
        return false;
    }

    /**
     * Verifie que le producteur possede le produit avec une quantite suffisante.
     *
     * @param idproducteur
     * @param idProduit
     * @param quantite
     * @return true si il possede le produit en quantite suffisante
     * @throws Exception si le producteur ne possede pas le produit en quantite suffisante
     * @throws Exception si le producteur ne possede pas le produit
     */
    public boolean doesPorducteurHaveEnough(Long idproducteur, Long idProduit, Float quantite) throws Exception {
        //System.out.println(produitRepository.findProduitsByProducteur(idproducteur).toString());
        if (!produitRepository.findProduitsByProducteur(idproducteur).isEmpty()) {
            Optional<Float> optionalQte = producteurRepository.getQteProduit(idproducteur, idProduit);
            if (optionalQte.isPresent() && optionalQte.get() >= quantite) {
                return true;
            } else
                throw new Exception("le producteur n°" + idproducteur + " n'a pas le produit n°" + idProduit + " en quantite suffiante");
        } else
            throw new Exception("Le producteur n°" + idproducteur + " : " + producteurRepository.findById(idproducteur).get().getLibelle() + " ne possede pas le produit n°" + idProduit + " : " + produitRepository.findById(idProduit).get().getLibelle());
    }

    @Autowired
    private CommandeProducteurRepository commandeProducteurRepository;

    @Autowired
    private CommandeDetailRepository commandeDetailRepository;

    /**
     * Verifie que la commande n'existe pas dans la base de donnees
     *
     * @param idCommandeProd
     * @return true si la commande n'existe pas
     * @throws Exception si la commande existe deja
     */
    public boolean doesCommandeProdExist(Long idCommandeProd) throws Exception {
        if (!commandeProducteurRepository.existsById(idCommandeProd)) {
            return true;
        } else throw new Exception("La commandeProducteur n°" + idCommandeProd + " existe deja");
    }

    /**
     * Verifie que la commande n'existe pas dans la base de données
     *
     * @param idCommandeDetail
     * @return true si elle n'existe pas
     * @throws Exception si la commande existe deja
     */
    public boolean doesCommandeDetailExist(Long idCommandeDetail) throws Exception {
        if (!commandeDetailRepository.existsById(idCommandeDetail)) {
            return true;
        } else throw new Exception("La commandeDetail n°" + idCommandeDetail + " existe deja");
    }


    //TODO =============================== A FINIR ================================

    /**
     * Verifications sont utiles pour la mise a jour d'une commande
     * On verifie : - la commande existe deja
     * - les commandeDetails existent deja
     * - les commandeProducteurs existent deja
     * - le client existe deja
     * - les producteurs existent
     * - les producteurs possedent ce produit en quantité suffisante
     * Dans le cas ou on rajoute des commandesProducteur/commandesDetails : verifications de créations + mise a jour automatique du stock
     * Dans le cas ou on suprime des commandesProducteur/commandesDetails : mise a jour automatique du stock
     *
     * @param updateCommandeInfo l'update de la commandeInfo
     * @return la CommandeInfo mis a jour.
     * @throws Exception
     */
    public boolean verifCommandeInfoUpdate(CommandeInfo updateCommandeInfo) throws Exception {
        //on recupere la commandeInfo originale avec l'id de la commande l'updateCommandeInfo car l'id d'une commande ne change pas.
        CommandeInfo originalCommandeInfo = getCommandeInfo(updateCommandeInfo.getCommande().getId());
        Collection<CommandeDetail> originalCommandeDetails = originalCommandeInfo.getCommandesDetails();

        return false;
    }

    /**
     * supprime la commandeInfo si possible
     *
     * @param idCommande id de la commande info a supprimer
     * @return true si la commande info a ete supprimee
     * @throws Exception si non
     */
    public void deletCommandeInfo(Long idCommande) throws Exception {

        CommandeInfo commandeInfoToDelete = getCommandeInfo(idCommande);

        //on reatribut le stock au producteur puis on supprime la commande producteur
        for (CommandeProducteur cp : commandeInfoToDelete.getCommandesProducteur()) {
            //si une commande producteur est dans la base de donnée alors elle est forcement liee a une commande detail.
            //on a besoin de la commande detail en question pour recuperer le produit
            Optional<CommandeDetail> cd = commandeDetailRepository.findById(cp.getIdCommandeDetails());
            commandeProducteurRepository.reatributStockToProducteur(cp.getIdProducteur(),cd.get().getIdProduit() ,cp.getQuantite());
        }

        //on supprime les commandes details
        for (CommandeDetail cd : commandeInfoToDelete.getCommandesDetails()) {
            commandeDetailRepository.delete(cd);
        }
        //on supprime la commande
        commandeRepository.delete(commandeInfoToDelete.getCommande());
    }

    /**
     * retrouve la commande info dans sa totalité à partir de l'id d'une commande
     *
     * @param idCommande de la commande
     * @return la commande info
     */
    public CommandeInfo getCommandeInfo(Long idCommande) throws Exception {
        //la commande info a reconstituer
        CommandeInfo savedCommandeInfo = new CommandeInfo();
        if (commandeRepository.findById(idCommande).isPresent()) {
            Optional<Commande> temp = commandeRepository.findById(idCommande);
            savedCommandeInfo.setCommande(temp.get());

            //on recupere toutes les commandes details associées à cette commande
            savedCommandeInfo.setCommandesDetails((Collection<CommandeDetail>) commandeDetailRepository.findAllByIdCommande(idCommande));

            ArrayList<CommandeProducteur> commandeProducteurs = new ArrayList<>();
            //on parcour toutes les commandesDetails pour retrouver toutes les commandesProducteur associees.
            for (CommandeDetail cd : savedCommandeInfo.getCommandesDetails()) {
                Collection<CommandeProducteur> commandesProd = (Collection<CommandeProducteur>) commandeProducteurRepository.findCommandeProdByCommandeDetail(cd.getId());
                commandeProducteurs.addAll(commandesProd);
            }
            savedCommandeInfo.setCommandesProducteur(commandeProducteurs);
            return savedCommandeInfo;
        }
         else throw new Exception("La commande n°" + idCommande + " n'existe pas.");
    }


}
