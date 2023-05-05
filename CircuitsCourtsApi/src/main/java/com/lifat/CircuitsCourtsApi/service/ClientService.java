package com.lifat.CircuitsCourtsApi.service;

import com.lifat.CircuitsCourtsApi.model.Client;
import com.lifat.CircuitsCourtsApi.model.Commande;
import com.lifat.CircuitsCourtsApi.repository.ClientRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ClientService {

    @Autowired
    ClientRepository clientRepository;

    @Autowired
    CommandeService commandeService;

    public Iterable<Client> getClients() {
        return clientRepository.findAll();
    }

    public Client saveClient(Client client) {
        Client savedClient = clientRepository.save(client);
        return savedClient;
    }

    public Client getClient(final Long id) {
        return clientRepository.findById(id).get();
    }

    public void deleteClient(final Long id) {
        clientRepository.deleteById(id);
    }

    public Iterable<Commande> getClientCommandes(Long id) {
        return commandeService.getCommandesByClientId(id);
    }
}
