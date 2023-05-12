package com.lifat.CircuitsCourtsApi.controller;

import com.lifat.CircuitsCourtsApi.model.Commande;
import com.lifat.CircuitsCourtsApi.model.CommandeDetail;
import com.lifat.CircuitsCourtsApi.model.CommandeProducteur;
import com.lifat.CircuitsCourtsApi.service.CommandeDetailService;
import com.lifat.CircuitsCourtsApi.service.CommandeProducteurService;
import com.lifat.CircuitsCourtsApi.service.CommandeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

//@CrossOrigin(origins = "http://localhost:3000")
@RestController
@RequestMapping("/api")
public class CommandeController {


    @Autowired
    private CommandeService commandeService;
    @Autowired
    private CommandeDetailService commandeDetailService;
    @Autowired
    private CommandeProducteurService commandeProducteurService;

    //Commandes
    @GetMapping("/commandes")
    @PreAuthorize("hasRole('ADMIN') or hasRole('ORGANISATEUR')")
    public ResponseEntity<?> getCommandes(){
        return ResponseEntity.ok(commandeService.getCommandes());
    }

    @GetMapping("/commandes/{id}")
    @PreAuthorize("hasRole('ADMIN') or hasRole('ORGANISATEUR')")
    public ResponseEntity<?> getCommandeById(@PathVariable Long id) {
            return ResponseEntity.ok(commandeService.getCommande(id));
    }

    @PostMapping("/commandes")
    @PreAuthorize("hasRole('ADMIN') or hasRole('ORGANISATEUR')")
    public ResponseEntity<?> saveCommande(@RequestBody Commande commande){
        Commande savedCommande = commandeService.saveCommande(commande);
        return ResponseEntity.ok(savedCommande);

    }

    @PreAuthorize("hasRole('ADMIN') or hasRole('ORGANISATEUR')")
    @ResponseBody
    @DeleteMapping("/commandes/{id}")
    public ResponseEntity<?> deletCommandeById(@PathVariable Long id) throws Exception {
            if (commandeService.getCommande(id) == null) {
                throw new Exception("commande n°" + id + " does not exist");
            }
            commandeService.deleteCommande(id);
            //envoi d'une reponse status 204 pour indiquer que la ressource à été supprimée avec succes.
            return ResponseEntity.noContent().build();
    }


    //Obtenir tous les détails de commandes.
    @PreAuthorize("hasRole('ADMIN') or hasRole('ORGANISATEUR')")
    @GetMapping("/commandes/details")
    public ResponseEntity<?> getAllCommandeDetails(){
            return ResponseEntity.ok(commandeDetailService.getCommandeDetails());
    }

    //Obtenir une commandeDetail avec son idCommande.
    @PreAuthorize("hasRole('ADMIN') or hasRole('ORGANISATEUR')")
    @GetMapping("/commandes/{id}/details")
    public ResponseEntity<?> getCommandeDetailByIdCommande(@PathVariable Long id){
            return ResponseEntity.ok(commandeDetailService.getCommandeDetailByCommandeId(id));
    }

    //Obtenir une CommandeDetail avec son id_CommandeDetail
    @PreAuthorize("hasRole('ADMIN') or hasRole('ORGANISATEUR')")
    @GetMapping("/commandes/details/{id}")
    public ResponseEntity<?> getCommandeDetailById(@PathVariable Long id){
            return ResponseEntity.ok(commandeDetailService.getCommandeDetail(id));
    }

    //Sauvegarder un détail de commande.
    @PreAuthorize("hasRole('ADMIN') or hasRole('ORGANISATEUR')")
    @PostMapping("/commandes/details")
    public ResponseEntity<?> saveCommandeDetail(@RequestBody CommandeDetail commandeDetail){
            return ResponseEntity.ok(commandeDetailService.saveCommandeDetail(commandeDetail));
    }

    //Supprimer un détail de commande.
    @PreAuthorize("hasRole('ADMIN') or hasRole('ORGANSIATEUR')")
    @ResponseBody
    @DeleteMapping("/commandes/details/{id}")
    public ResponseEntity<?> deleteCommandeDetail(@PathVariable Long id) throws Exception {
            if (commandeDetailService.getCommandeDetail(id) == null) {
                throw new Exception("commandeDetail n°" + id + " does not exist");
            }
            commandeDetailService.deleteCommandeDetail(id);
            //envoi d'une reponse status 204 pour indiquer que la ressource à été supprimée avec succes.
            return ResponseEntity.noContent().build();
    }


    //commandesProducteur.
    @PreAuthorize("hasRole('ADMIN') or hasRole('ORGANSIATEUR')")
    @GetMapping("/commandes/producteurs")
    public ResponseEntity<?> getAllCommandeProducteur(){
            return ResponseEntity.ok(commandeProducteurService.getCommandeProducteurs());
    }

    @PreAuthorize("hasRole('ADMIN') or hasRole('ORGANISATEUR')")
    @GetMapping("/commandes/producteurs/{id}")
    public ResponseEntity<?> getCommandeProducteurById(@PathVariable Long id){
            return ResponseEntity.ok(commandeProducteurService.getCommandeProducteur(id));
    }

    @PreAuthorize("hasRole('ADMIN') or hasRole('ORGANISATEUR')")
    @GetMapping("/commandes/{id}/producteur")
    public ResponseEntity<?> getCommandeProducteurByCommandeDetail(@PathVariable Long id) {
            return ResponseEntity.ok(commandeProducteurService.getCommandeProducteurByCommandeDetail(id));
    }
    @PreAuthorize("hasRole('ADMIN') or hasRole('ORGANISATEUR')")
    @PostMapping("/commandes/producteurs")
    public ResponseEntity<?> saveCommandeProducteur(@RequestBody CommandeProducteur commandeProducteur){
            return ResponseEntity.ok(commandeProducteurService.saveCommandeProducteur(commandeProducteur));
    }

    @PreAuthorize("hasRole('ADMIN') or hasRole('ORGANISATEUR')")
    @ResponseBody
    @DeleteMapping("/commandes/producteurs/{id}")
    public ResponseEntity<?> deleteCommandeProducteur(@PathVariable Long id) throws Exception{
            if (commandeProducteurService.getCommandeProducteur(id) == null) {
                throw new Exception("commandeProducteur n°" + id + " does not exist");
            }
            commandeProducteurService.deleteCommandeProducteur(id);
            //envoi d'une reponse status 204 pour indiquer que la ressource à été supprimée avec succes.
            return ResponseEntity.noContent().build();
    }

    @PreAuthorize("hasRole('ADMIN') or hasRole('ORGANISATEUR')")
    @GetMapping("/commandes/client/{id}")
    public ResponseEntity<?> getCommandesByClientId(@PathVariable Long id){
            return ResponseEntity.ok(commandeService.getCommandesByClientId(id));
    }


    /*
    @GetMapping("/commandes/byProducteursId/{id}")
        public ResponseEntity<?> getCommandesByProducteurId(@PathVariable Long id, @RequestParam String key) throws Exception {
            if (jwtUtil.isValidToken(key)){
                return ResponseEntity.ok(commandeProducteurService.getCommandeByProducteurId(id));
        }else return ResponseEntity.badRequest().body("Invalid token");
    }

     */

    //obtient les commandesProd par producteur
    @PreAuthorize("hasRole('ADMIN') or hasRole('ORGANISATEUR')")
    @GetMapping("/commandesProd/producteurs/{id}")
    public ResponseEntity<?> getCommandesProdByProdId(@PathVariable Long id){
            return ResponseEntity.ok(commandeProducteurService.getCommandesProducteurByIdProducteur(id));
    }

    //obtient les commandes par producteur
    @PreAuthorize("hasRole('ADMIN') or hasRole('ORGANISATEUR') or hasRole('PRODUCTEUR')")
    @GetMapping("/commandesByProducteur/{id}")
    public ResponseEntity<?> getCommandesByProducteurId(@PathVariable Long id){
        return ResponseEntity.ok(commandeService.getAllCommandesByProd(id));
    }
}
