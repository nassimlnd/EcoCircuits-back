package com.lifat.CircuitsCourtsApi.controller;

import com.lifat.CircuitsCourtsApi.model.Commande;
import com.lifat.CircuitsCourtsApi.model.CommandeDetail;
import com.lifat.CircuitsCourtsApi.model.CommandeProducteur;
import com.lifat.CircuitsCourtsApi.service.CommandeDetailService;
import com.lifat.CircuitsCourtsApi.service.CommandeProducteurService;
import com.lifat.CircuitsCourtsApi.service.CommandeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping ("/api")
public class CommandeController {

    @Autowired
    private CommandeService commandeService;
    @Autowired
    private CommandeDetailService commandeDetailService;
    @Autowired
    private CommandeProducteurService commandeProducteurService;

    //Commandes
    @GetMapping("/commandes")
    public Iterable<Commande> getCommandes() {
        return commandeService.getCommandes();
    }

    @GetMapping("/commandes/{id}")
    public Commande getCommandeById(@PathVariable Long id){
        return commandeService.getCommande(id);
    }

    @PostMapping("/commandes")
    public Commande saveCommande(@RequestBody Commande commande){
        Commande savedCommande = commandeService.saveCommande(commande);
        return commande;
    }

    @DeleteMapping("/commande/{id}")
    public void deletCommandeById(@PathVariable Long id){
        commandeService.deleteCommande(id);
    }


    //Obtenir tous les détails de commandes.

    @GetMapping("/commandes/details")
    public Iterable<CommandeDetail> getAllCommandeDetails(){
        return commandeDetailService.getCommandeDetails();
    }

    //Obtenir une commandeDetail avec son idCommande.
    @GetMapping("/commandes/{id}/details")
    public CommandeDetail getCommandeDetailByIdCommande(@PathVariable Long id){
        return commandeDetailService.getCommandeDetailByCommandeId(id);
    }

    //Obtenir une CommandeDetail avec son id_CommandeDetail
    @GetMapping("/commandes/details/{id}")
    public CommandeDetail getCommandeDetailById(@PathVariable Long id){
        return commandeDetailService.getCommandeDetail(id);
    }

    //Sauvegarder un détail de commande.
    @PostMapping("/commandes/details")
    public CommandeDetail saveCommandeDetail(@RequestBody CommandeDetail commandeDetail){
        return commandeDetailService.saveCommandeDetail(commandeDetail);
    }

    //Supprimer un détail de commande.
    @DeleteMapping("/commades/details/{id}")
    public void deletCommandeDetail(@PathVariable Long id){
        commandeDetailService.deleteCommandeDetail(id);
    }


    //commandesProducteur.
    @GetMapping("/commandes/producteurs")
    public Iterable<CommandeProducteur> getAllCommandeProducteur(){
        return commandeProducteurService.getCommandeProducteurs();
    }

    @GetMapping("/commandes/producteurs/{id}")
    public CommandeProducteur getCommandeProducteurById(@PathVariable Long id){
        return commandeProducteurService.getCommandeProducteur(id);
    }

    @GetMapping("/commandes/{id}/producteur")
    public CommandeProducteur getCommandeProducteurByCommandeDetail(@PathVariable Long id){
        return commandeProducteurService.getCommandeProducteurByCommandeDetail(id);
    }
}
