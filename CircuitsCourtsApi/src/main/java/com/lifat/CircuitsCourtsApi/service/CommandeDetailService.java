package com.lifat.CircuitsCourtsApi.service;

import com.lifat.CircuitsCourtsApi.model.CommandeDetail;
import com.lifat.CircuitsCourtsApi.model.CommandeProducteur;
import com.lifat.CircuitsCourtsApi.repository.CommandeDetailRepository;
import com.lifat.CircuitsCourtsApi.repository.CommandeProducteurRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Collection;
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

    public Optional<CommandeDetail> getCommandeDetail(final Long id) {
        return commandeDetailRepository.findById(id);
    }

    public void deleteCommandeDetail(final Long id) {
        commandeDetailRepository.deleteById(id);
    }

    public Iterable<CommandeDetail> getCommandeDetailByCommandeId(Long commandeId){
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


    @Autowired
    private CommandeProducteurRepository commandeProducteurRepository;

    /**
     * supprime une commande detail avec toutes ses commandes prod.
     * @param commandeDetail
     */
    public void deletCommandeDetail(CommandeDetail commandeDetail){
        Collection<CommandeProducteur> cp = (Collection<CommandeProducteur>) commandeProducteurRepository.findByidCommandeDetails(commandeDetail.getIdCommande());
        commandeDetailRepository.delete(commandeDetail);
        commandeProducteurRepository.deleteAll(cp);
    }
}
