package com.lifat.CircuitsCourtsApi.service;

import com.lifat.CircuitsCourtsApi.model.CommandeDetail;
import com.lifat.CircuitsCourtsApi.repository.CommandeDetailRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

}
