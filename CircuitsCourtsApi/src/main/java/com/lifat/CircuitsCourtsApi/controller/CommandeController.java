package com.lifat.CircuitsCourtsApi.controller;

import com.lifat.CircuitsCourtsApi.JWTEndPointsProtection.JwtUtil;
import com.lifat.CircuitsCourtsApi.model.Commande;
import com.lifat.CircuitsCourtsApi.model.CommandeDetail;
import com.lifat.CircuitsCourtsApi.model.CommandeProducteur;
import com.lifat.CircuitsCourtsApi.service.CommandeDetailService;
import com.lifat.CircuitsCourtsApi.service.CommandeProducteurService;
import com.lifat.CircuitsCourtsApi.service.CommandeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.jersey.JerseyAutoConfiguration;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

//@CrossOrigin(origins = "http://localhost:3000")
@RestController
@RequestMapping ("/api")
public class CommandeController {

    @Autowired
    JwtUtil jwtUtil;
    @Autowired
    private CommandeService commandeService;
    @Autowired
    private CommandeDetailService commandeDetailService;
    @Autowired
    private CommandeProducteurService commandeProducteurService;

    //Commandes
    @GetMapping("/commandes")
    public ResponseEntity<?> getCommandes(@RequestParam String key) throws Exception {
        if(jwtUtil.isValidToken(key)){
            return ResponseEntity.ok(commandeService.getCommandes());
        }else return ResponseEntity.badRequest().body("Invalid token");

    }

    @GetMapping("/commandes/{id}")
    public ResponseEntity<?> getCommandeById(@PathVariable Long id, @RequestParam String key) throws Exception {
        if(jwtUtil.isValidToken(key)){
            return ResponseEntity.ok(commandeService.getCommande(id));
        }else return ResponseEntity.badRequest().body("Ivalid token");

    }

    @PostMapping("/commandes")
    public ResponseEntity<?> saveCommande(@RequestBody Commande commande, @RequestParam String key) throws Exception {
        if(jwtUtil.isValidToken(key)){
            Commande savedCommande = commandeService.saveCommande(commande);
            return ResponseEntity.ok(savedCommande);
        }else return ResponseEntity.badRequest().body("Invalid token");

    }

    @ResponseBody
    @DeleteMapping("/commandes/{id}")
    public ResponseEntity<?> deletCommandeById(@PathVariable Long id, @RequestParam String key) throws Exception {
        if(jwtUtil.isValidToken(key)){
            if(commandeService.getCommande(id) == null){
                throw new Exception("commande n°"+id+" does not exist");
            }
            commandeService.deleteCommande(id);
            //envoi d'une reponse status 204 pour indiquer que la ressource à été supprimée avec succes.
            return ResponseEntity.noContent().build();
        }else return ResponseEntity.badRequest().body("Invalid token");

    }


    //Obtenir tous les détails de commandes.
    @GetMapping("/commandes/details")
    public ResponseEntity<?> getAllCommandeDetails(@RequestParam String key) throws Exception {
        if(jwtUtil.isValidToken(key)){
            return ResponseEntity.ok(commandeDetailService.getCommandeDetails());
        }else return ResponseEntity.badRequest().body("Invalid token");

    }

    //Obtenir une commandeDetail avec son idCommande.
    @GetMapping("/commandes/{id}/details")
    public ResponseEntity<?> getCommandeDetailByIdCommande(@PathVariable Long id, @RequestParam String key) throws Exception {
        if(jwtUtil.isValidToken(key)){
            return ResponseEntity.ok(commandeDetailService.getCommandeDetailByCommandeId(id));
        }else return ResponseEntity.badRequest().body("Invalid token");
    }

    //Obtenir une CommandeDetail avec son id_CommandeDetail
    @GetMapping("/commandes/details/{id}")
    public ResponseEntity<?> getCommandeDetailById(@PathVariable Long id, @RequestParam String key) throws Exception {
        if(jwtUtil.isValidToken(key)){
            return ResponseEntity.ok(commandeDetailService.getCommandeDetail(id));
        }else return ResponseEntity.badRequest().body("Invalid token");
    }

    //Sauvegarder un détail de commande.
    @PostMapping("/commandes/details")
    public ResponseEntity<?> saveCommandeDetail(@RequestBody CommandeDetail commandeDetail, @RequestParam String key) throws Exception {
        if(jwtUtil.isValidToken(key)){
            return ResponseEntity.ok(commandeDetailService.saveCommandeDetail(commandeDetail));
        }else return ResponseEntity.badRequest().body("Invalid token");
    }

    //Supprimer un détail de commande.
    @ResponseBody
    @DeleteMapping("/commandes/details/{id}")
    public ResponseEntity<?> deleteCommandeDetail(@PathVariable Long id, @RequestParam String key) throws Exception {
        if(jwtUtil.isValidToken(key)){
            if(commandeDetailService.getCommandeDetail(id) == null){
                throw new Exception("commandeDetail n°"+id+" does not exist");
            }
            commandeDetailService.deleteCommandeDetail(id);
            //envoi d'une reponse status 204 pour indiquer que la ressource à été supprimée avec succes.
            return ResponseEntity.noContent().build();
        }else return ResponseEntity.badRequest().body("Invalid token");

    }


    //commandesProducteur.
    @GetMapping("/commandes/producteurs")
    public ResponseEntity<?> getAllCommandeProducteur(@RequestParam String key) throws Exception {
        if(jwtUtil.isValidToken(key)){
            return ResponseEntity.ok(commandeProducteurService.getCommandeProducteurs());
        }else return ResponseEntity.badRequest().body("Invalid token");
    }

    @GetMapping("/commandes/producteurs/{id}")
    public ResponseEntity<?> getCommandeProducteurById(@PathVariable Long id, @RequestParam String key) throws Exception {
        if(jwtUtil.isValidToken(key)){
            return ResponseEntity.ok(commandeProducteurService.getCommandeProducteur(id));
        }else return ResponseEntity.badRequest().body("Invalid Token");
    }

    @GetMapping("/commandes/{id}/producteur")
    public ResponseEntity<?> getCommandeProducteurByCommandeDetail(@PathVariable Long id, @RequestParam String key) throws Exception {
        if(jwtUtil.isValidToken(key)){
            return ResponseEntity.ok(commandeProducteurService.getCommandeProducteurByCommandeDetail(id));
        }else return ResponseEntity.badRequest().body("Invalid token");
    }

    @PostMapping("/commandes/producteurs")
    public ResponseEntity<?> saveCommandeProducteur(@RequestBody CommandeProducteur commandeProducteur, @RequestParam String key) throws Exception {
       if(jwtUtil.isValidToken(key)){
           return ResponseEntity.ok(commandeProducteurService.saveCommandeProducteur(commandeProducteur));
       }else return ResponseEntity.badRequest().body("Invalid token");
    }


    @ResponseBody
    @DeleteMapping("/commandes/producteurs/{id}")
    public ResponseEntity<?> deleteCommandeProducteur(@PathVariable Long id, @RequestParam String key) throws Exception {
        if(jwtUtil.isValidToken(key)){
            if(commandeProducteurService.getCommandeProducteur(id) == null){
                throw new Exception("commandeProducteur n°"+id+" does not exist");
            }
            commandeProducteurService.deleteCommandeProducteur(id);
            //envoi d'une reponse status 204 pour indiquer que la ressource à été supprimée avec succes.
            return ResponseEntity.noContent().build();
        }else return ResponseEntity.badRequest().body("Invalid Token");
    }


    @GetMapping("/commandes/client/{id}")
    public ResponseEntity<?> getCommandesByClientId(@PathVariable Long id, @RequestParam String key) throws Exception {

        if(jwtUtil.isValidToken(key)){
            return ResponseEntity.ok(commandeService.getCommandesByClientId(id));
        }else return ResponseEntity.badRequest().body("Invalid token");
    }


    /*
    @GetMapping("/commandes/byProducteursId/{id}")
        public ResponseEntity<?> getCommandesByProducteurId(@PathVariable Long id, @RequestParam String key) throws Exception {
            if (jwtUtil.isValidToken(key)){
                return ResponseEntity.ok(commandeProducteurService.getCommandeByProducteurId(id));
        }else return ResponseEntity.badRequest().body("Invalid token");
    }

     */

    @GetMapping("/commandesProd/producteurs/{id}")
    public ResponseEntity<?> getCommandesProdByProdId(@PathVariable Long id, @RequestParam String key) throws Exception {
        if(jwtUtil.isValidToken(key)){
            return ResponseEntity.ok(commandeProducteurService.getCommandesProducteurByIdProducteur(id));
        }else return ResponseEntity.badRequest().body("Invalid token");
    }
}
