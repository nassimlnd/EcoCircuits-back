package com.lifat.CircuitsCourtsApi.controller;

import com.lifat.CircuitsCourtsApi.model.Commande;
import com.lifat.CircuitsCourtsApi.service.CommandeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class CommandeController {

    @Autowired
    private CommandeService commandeService;

    @GetMapping("/commandes")
    public Iterable<Commande> getCommandes() {
        return commandeService.getCommandes();
    }


}
