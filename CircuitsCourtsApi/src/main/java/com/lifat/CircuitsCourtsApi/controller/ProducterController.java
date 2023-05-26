package com.lifat.CircuitsCourtsApi.controller;

import com.lifat.CircuitsCourtsApi.model.Producteur;
import com.lifat.CircuitsCourtsApi.model.Produit;
import com.lifat.CircuitsCourtsApi.model.ProduitProducteurId;
import com.lifat.CircuitsCourtsApi.model.ProduitsProducteurs;
import com.lifat.CircuitsCourtsApi.payload.response.ProducteursProduitResponse;
import com.lifat.CircuitsCourtsApi.service.ProducteurServices;
import com.lifat.CircuitsCourtsApi.service.ProduitProducteurService;
import com.lifat.CircuitsCourtsApi.service.ProduitService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.*;

@CrossOrigin(origins = "http://localhost:3000")
@RequestMapping("/api")
@RestController
public class ProducterController {

    @Autowired
    private ProducteurServices producteurServices;

    @Autowired
    private ProduitService produitService;

    @Autowired
    private ProduitProducteurService produitProducteurService;

    @PreAuthorize("hasRole('ADMIN') or hasRole('ORGANISATEUR')")
    @GetMapping("/producteurs")
    public Iterable<Producteur> getAllProducteurs() {
        return producteurServices.getAllProducteurs();
    }

    @PreAuthorize("hasRole('ADMIN') or hasRole('ORGANISATEUR')")
    @GetMapping("/producteurs/{id}")
    public ResponseEntity<?> getProducteurById(@PathVariable Long id) {
        Optional<Producteur> existingProducteur = producteurServices.getProducteurById(id);
        if (existingProducteur.isEmpty()) {
            return ResponseEntity.badRequest().body("le producteur n°" + id + " n'existe pas.");
        }
        return ResponseEntity.ok().body(producteurServices.getProducteurById(id));
    }

    @PreAuthorize("hasRole('ADMIN') or hasRole('ORGANISATEUR')")
    @PostMapping("/producteurs")
    public ResponseEntity<?> saveProducteur(@RequestBody Producteur producteur) {
        return ResponseEntity.ok().body(producteurServices.saveProducteur(producteur));
    }

    @PreAuthorize("hasRole('ADMIN') or hasRole('ORGANISATEUR')")
    @DeleteMapping("/producteurs/{id}")
    public ResponseEntity<?> deletProducteurById(@PathVariable Long id) throws Exception {
        Optional<Producteur> existingProducteur = producteurServices.getProducteurById(id);
        if (existingProducteur.isEmpty()) {
            return ResponseEntity.badRequest().body("le producteur n°" + id + " n'existe pas.");
        }
        producteurServices.deletProducteurById(id);
        //envoi d'une reponse status 204 pour indiquer que la ressource à été supprimée avec succes.
        return ResponseEntity.noContent().build();
    }


    /**
     * Renvoi tous les producteurs qui produisent ce produit
     *
     * @param idProduit le produit
     * @return la liste des producteurs
     */
    @PreAuthorize("hasRole('ADMIN') or hasRole('ORGANISATEUR')")
    @GetMapping("/producteurs/produit/{idProduit}")
    public ResponseEntity<?> getProdByProduits(@PathVariable Long idProduit) {
        Produit existingProduit = produitService.getProduit(idProduit).isPresent() ? produitService.getProduit(idProduit).get() : null;

        if (existingProduit == null) {
            return ResponseEntity.badRequest().body("le produit n°" + idProduit + " n'existe pas.");
        }

        Collection<Producteur> producteurs = producteurServices.getAllProducteurdByProduits(idProduit);

        ArrayList<ProducteursProduitResponse> producteursProduitResponses = new ArrayList<>();

        producteurs.forEach(producteur -> {
            ProduitProducteurId id = new ProduitProducteurId(existingProduit.getId(), producteur.getId_Producteur());
            ProduitsProducteurs produitsProducteurs = produitProducteurService.getById(id).get();
            ProducteursProduitResponse producteursProduitResponse = new ProducteursProduitResponse();

            producteursProduitResponse.setId(producteur.getId_Producteur());
            producteursProduitResponse.setNom(producteur.getLibelle());
            producteursProduitResponse.setDescription(producteur.getDescription());
            producteursProduitResponse.setTags(producteur.getTags());
            producteursProduitResponse.setAdresse(producteur.getAdresse());
            producteursProduitResponse.setMail(producteur.getMail());
            producteursProduitResponse.setRayonLivraison(producteur.getRayon_Livraison());
            producteursProduitResponse.setIdProduit(existingProduit.getId());
            producteursProduitResponse.setLibelle(existingProduit.getLibelle());
            producteursProduitResponse.setQuantite(produitsProducteurs.getQuantite());

            producteursProduitResponses.add(producteursProduitResponse);
        });

        return ResponseEntity.ok().body(producteursProduitResponses);
    }


    /**
     * update la quantité d'un produit d'un producteur avec un put(update complete)
     *
     * @param id      id du producteur qui a ce produit
     * @param produit le nouveau produit a sauvegarder
     * @return le nouveau produit
     * @Param stock représente la quantiter a modifier
     */
    @PreAuthorize("hasRole('ADMIN') or hasRole('ORGANISATEUR') or hasRole ('PRODUCTEUR')")
    @PutMapping("/producteur/produit/update/{id}")
    public ResponseEntity<?> updateQteProduit(@PathVariable Long id, @RequestBody Produit produit, @RequestParam Float stock) {
        Optional<Producteur> existingProd = producteurServices.getProducteurById(id);
        Optional<Produit> existingProduit = produitService.getProduit(produit.getId());
        if (existingProd.isEmpty() || existingProduit.isEmpty()) {
            return ResponseEntity.badRequest().body("le producteur n°" + id + "n'existe pas ou le produit n°" + produit.getId() + " n'existe pas");
        }
        //recupere le produit producteur et modifie la quantite via son produitProducteurId
        ProduitProducteurId produitProducteurId = new ProduitProducteurId(produit.getId(), id);
        Optional<ProduitsProducteurs> pp = produitProducteurService.getById(produitProducteurId);
        if (pp.isPresent()) {
            pp.get().setQuantite(stock);
            produitProducteurService.save(pp.get());
            //renvoi la nouvelle quantité du produit pour ce producteur
            return ResponseEntity.ok().body(pp.get().getQuantite());
        }
        return ResponseEntity.badRequest().build();
    }

}
