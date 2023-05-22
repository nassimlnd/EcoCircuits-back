package com.lifat.CircuitsCourtsApi.service;

import com.github.fge.jsonpatch.JsonPatch;
import com.lifat.CircuitsCourtsApi.model.Commande;
import com.lifat.CircuitsCourtsApi.model.CommandeDetail;
import com.lifat.CircuitsCourtsApi.model.CommandeInfo;
import com.lifat.CircuitsCourtsApi.model.CommandeProducteur;
import com.lifat.CircuitsCourtsApi.repository.CommandeDetailRepository;
import com.lifat.CircuitsCourtsApi.repository.CommandeProducteurRepository;
import com.lifat.CircuitsCourtsApi.repository.CommandeRepository;
import com.lifat.CircuitsCourtsApi.repository.ProduitRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Collection;
import java.util.Iterator;

@Service
public class CommandeInfoService {

    @Autowired
    private CommandeRepository commandeRepository;

    @Autowired
    private CommandeDetailRepository commandeDetailRepository;

    @Autowired
    private CommandeProducteurRepository commandeProducteurRepository;

    /**
     * Recupere une commandeInfo, la décompose en objets et met a jour tous les objets, update totale.
     * @param newCommandeInfo la nouvelle commandeInfo à sauvegarder
     * @return la nouvelle commandeInfo
     */
    public CommandeInfo updateCommandeInfo(CommandeInfo newCommandeInfo){
        //la verification de l'existence de la commande se fait dans le controller
        Commande existingCommande = newCommandeInfo.getCommande();
        existingCommande.setIdClient(newCommandeInfo.getCommande().getIdClient());
        existingCommande.setDateCommande((newCommandeInfo.getCommande().getDateCommande()));
        commandeRepository.save(existingCommande);

        //on verifie si la commande a bien au moins une commande detail, si elle est vide on ajoute les commande details directement
        Collection<CommandeDetail> existingCommandesDetails = newCommandeInfo.getCommandesDetails();
        if(existingCommandesDetails.isEmpty()){
            existingCommandesDetails.addAll(newCommandeInfo.getCommandesDetails());
        }else {
            // si la liste n'est pas vide on boucle sur toutes les commandesDetails de la newCommandeInfo pour les modifier
            for (CommandeDetail cd : existingCommandesDetails) {
                commandeDetailRepository.save(cd);
            }
        }
        //on verifie si la liste dede CommandeProducteur est vide
        Collection<CommandeProducteur> existingCommandesProducteurs = newCommandeInfo.getCommandesProducteur();
        if(existingCommandesProducteurs.isEmpty()){
            existingCommandesProducteurs.addAll(newCommandeInfo.getCommandesProducteur());
        }else{
            //si la liste n'est pas vide on boucle sur toutes les commandesProducteur de la newCommandeInfo pour les modifier
            for(CommandeProducteur cp : existingCommandesProducteurs){
                commandeProducteurRepository.save(cp);
            }
        }
        return newCommandeInfo;
    }
}
