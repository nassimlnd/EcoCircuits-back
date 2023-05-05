package com.lifat.CircuitsCourtsApi.controller;

import com.lifat.CircuitsCourtsApi.model.Commande;
import com.lifat.CircuitsCourtsApi.model.CommandeDetail;
import com.lifat.CircuitsCourtsApi.model.CommandeProducteur;
import com.lifat.CircuitsCourtsApi.service.CommandeDetailService;
import com.lifat.CircuitsCourtsApi.service.CommandeProducteurService;
import com.lifat.CircuitsCourtsApi.service.CommandeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
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

    @CrossOrigin(origins = "http://localhost:9020")
    @ResponseBody
    @DeleteMapping("/commandes/{id}")
    public ResponseEntity<Void> deletCommandeById(@PathVariable Long id) throws Exception {
        if(commandeService.getCommande(id) == null){
            throw new Exception("commande n°"+id+" does not exist");
        }
        commandeService.deleteCommande(id);
        //envoi d'une reponse status 204 pour indiquer que la ressource à été supprimée avec succes.
        return ResponseEntity.noContent().build();
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
    //@CrossOrigin(origins = "http://localhost:9020")
    @PostMapping("/commandes/details")
    public CommandeDetail saveCommandeDetail(@RequestBody CommandeDetail commandeDetail){
        return commandeDetailService.saveCommandeDetail(commandeDetail);
    }

    //Supprimer un détail de commande.
    @CrossOrigin(origins = "http://localhost:9020")
    @ResponseBody
    @DeleteMapping("/commandes/details/{id}")
    public ResponseEntity<Object> deleteCommandeDetail(@PathVariable Long id) throws Exception {
        if(commandeDetailService.getCommandeDetail(id) == null){
            throw new Exception("commandeDetail n°"+id+" does not exist");
        }
        commandeDetailService.deleteCommandeDetail(id);
        //envoi d'une reponse status 204 pour indiquer que la ressource à été supprimée avec succes.
        return ResponseEntity.noContent().build();
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

    @PostMapping("/commandes/producteurs")
    public CommandeProducteur saveCommandeProducteur(@RequestBody CommandeProducteur commandeProducteur){
        return commandeProducteurService.saveCommandeProducteur(commandeProducteur);
    }

    @CrossOrigin(origins = "http://localhost:9020")
    @ResponseBody
    @DeleteMapping("/commandes/producteurs/{id}")
    public ResponseEntity<Void> deleteCommandeProducteur(@PathVariable Long id) throws Exception {
        if(commandeProducteurService.getCommandeProducteur(id) == null){
            throw new Exception("commandeProducteur n°"+id+" does not exist");
        }
        commandeProducteurService.deleteCommandeProducteur(id);
        //envoi d'une reponse status 204 pour indiquer que la ressource à été supprimée avec succes.
        return ResponseEntity.noContent().build();
    }
}
