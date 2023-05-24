package com.lifat.CircuitsCourtsApi.service;

import com.lifat.CircuitsCourtsApi.model.Client;
import com.lifat.CircuitsCourtsApi.model.Commande;
import com.lifat.CircuitsCourtsApi.repository.ClientRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

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

    public Optional<Client> getClient(final Long id) {
        return clientRepository.findById(id);
    }

    public void deleteClient(final Long id) {
        clientRepository.deleteById(id);
    }

    public Iterable<Commande> getClientCommandes(Long id) {
        return commandeService.getCommandesByClientId(id);
    }

    public Client updateClient(Long id, Client client) {

        if (getClient(id) == null) {
            return null;
        }

        Client oldClient = getClient(id);
        oldClient.setNom(client.getNom());
        oldClient.setPrenom(client.getPrenom());
        oldClient.setAdresse(client.getAdresse());
        oldClient.setVille(client.getVille());
        oldClient.setCodePostal(client.getCodePostal());
        oldClient.setTelephone(client.getTelephone());
        oldClient.setEmail(client.getEmail());

        return saveClient(oldClient);
    }
}
