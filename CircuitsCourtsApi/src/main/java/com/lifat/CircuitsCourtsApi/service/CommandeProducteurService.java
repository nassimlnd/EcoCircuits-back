package com.lifat.CircuitsCourtsApi.service;

import com.lifat.CircuitsCourtsApi.model.Commande;
import com.lifat.CircuitsCourtsApi.model.CommandeDetail;
import com.lifat.CircuitsCourtsApi.model.CommandeProducteur;
import com.lifat.CircuitsCourtsApi.repository.CommandeDetailRepository;
import com.lifat.CircuitsCourtsApi.repository.CommandeProducteurRepository;
import com.lifat.CircuitsCourtsApi.repository.CommandeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Optional;

@Service
public class CommandeProducteurService {

    @Autowired
    private CommandeProducteurRepository commandeProducteurRepository;
    @Autowired
    private CommandeDetailRepository commandeDetailRepository;

    @Autowired
    private CommandeRepository commandeRepository;

    public Iterable<CommandeProducteur> getCommandeProducteurs() {
        return commandeProducteurRepository.findAll();
    }

    public CommandeProducteur saveCommandeProducteur(CommandeProducteur commandeProducteur) {
        CommandeProducteur savedCommandeProducteur = commandeProducteurRepository.save(commandeProducteur);
        return savedCommandeProducteur;
    }

    public CommandeProducteur getCommandeProducteur(final Long id) {
        return commandeProducteurRepository.findById(id).get();
    }

    public void deleteCommandeProducteur(final Long id) {
        commandeProducteurRepository.deleteById(id);
    }

    public CommandeProducteur getCommandeProducteurByCommandeDetail(Long commandeDetailId){
        return commandeProducteurRepository.findByidCommandeDetails(commandeDetailId);
    }

   public Iterable<CommandeProducteur> getCommandesProducteurByIdProducteur(Long idProd){
        return commandeProducteurRepository.findByIdProducteur(idProd);
   }
}
