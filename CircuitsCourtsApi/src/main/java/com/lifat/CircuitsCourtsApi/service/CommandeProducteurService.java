package com.lifat.CircuitsCourtsApi.service;

import com.lifat.CircuitsCourtsApi.model.CommandeProducteur;
import com.lifat.CircuitsCourtsApi.repository.CommandeProducteurRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CommandeProducteurService {

    @Autowired
    private CommandeProducteurRepository commandeProducteurRepository;

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

}
