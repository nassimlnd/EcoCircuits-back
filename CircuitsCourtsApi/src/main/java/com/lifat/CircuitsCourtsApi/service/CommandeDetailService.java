package com.lifat.CircuitsCourtsApi.service;

import com.lifat.CircuitsCourtsApi.model.CommandeDetail;
import com.lifat.CircuitsCourtsApi.repository.CommandeDetailRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class CommandeDetailService {

    @Autowired
    private CommandeDetailRepository commandeDetailRepository;

    public Iterable<CommandeDetail> getCommandeDetails() {
        return commandeDetailRepository.findAll();
    }

    public CommandeDetail saveCommandeDetail(CommandeDetail commandeDetail) {
        CommandeDetail savedCommandeDetail = commandeDetailRepository.save(commandeDetail);
        return savedCommandeDetail;
    }

    public CommandeDetail getCommandeDetail(final Long id) {
        return commandeDetailRepository.findById(id).get();
    }

    public void deleteCommandeDetail(final Long id) {
        commandeDetailRepository.deleteById(id);
    }

    public CommandeDetail getCommandeDetailByCommandeId(Long commandeId){
        return commandeDetailRepository.findByIdCommande(commandeId);
    }

    public Optional<CommandeDetail> findById(Long idCommandeDetails) {
        return commandeDetailRepository.findById(idCommandeDetails);
    }

    public Iterable<CommandeDetail> findAllByIdCommande(Long idCommande) {
        return commandeDetailRepository.findAllByIdCommande(idCommande);
    }

    public Iterable<CommandeDetail> findAllByCommandeAndProducteur(Long idProd, Long idCommande){
        return commandeDetailRepository.findCommandeDetailsByCommandesAndProducteur(idProd, idCommande);
    }
}
