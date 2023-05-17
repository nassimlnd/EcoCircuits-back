package com.lifat.CircuitsCourtsApi.model;

import com.lifat.CircuitsCourtsApi.service.CommandeDetailService;
import com.lifat.CircuitsCourtsApi.service.CommandeProducteurService;
import lombok.Data;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Collection;

/**
 * Cette classe sert simplement d'enveloppe pour envoyer le plus d'info possibles dans une seule requete http, ne se stock pas dans la BD.
 * Une CommandeInfo contient une commande et toutes les commandes détails associées à la commande
 *
 * Une Commande info est utilisée dans 2 cas :
 *  -on à besoin de tous les details d'une commande(Admin ou organisateur) et on recupère toutes les données d'une commande.
 *  -on à besoin des détails d'un commande en fonction d'un producteur(producteur) on recupere les données de cette commande en fonction
 *  de ce producteur.
 */
@Data

public class CommandeInfo {
    @Autowired
    Commande commande;

    @Autowired
    CommandeDetailService commandeDetailService;

    @Autowired
    CommandeProducteurService commandeProducteurService;

    public CommandeInfo(Commande commande){
        this.commande = commande;
    }

    private Collection<CommandeDetail> commandesDetails;

    private Collection<CommandeProducteur> commandesProducteur = null;

    //remplit la collection de commande details avec toutes les commandes details
    public void fillWithCommandesDetails(){
        this.commandesDetails.add((CommandeDetail) commandeDetailService.findAllByIdCommande(commande.getId()));
    }

    //remplit la collection de CommandeDetails avec les commandes details du producteur
    //remplie la collection de CommandesProducteur avec les bonnes CommandesProducteur
    public void fillWithCommandeDetailsByPRod(Long idProducteur){
        this.commandesProducteur.add((CommandeProducteur) commandeProducteurService.findByIdProducteur(idProducteur));
        for (CommandeProducteur cp: commandesProducteur) {
            commandeDetailService.findById(cp.getIdCommandeDetails());
        }
    }
}
