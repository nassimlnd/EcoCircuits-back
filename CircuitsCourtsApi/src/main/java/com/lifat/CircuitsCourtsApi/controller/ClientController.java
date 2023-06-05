package com.lifat.CircuitsCourtsApi.controller;

import com.lifat.CircuitsCourtsApi.model.Adresse;
import com.lifat.CircuitsCourtsApi.model.Client;
import com.lifat.CircuitsCourtsApi.payload.response.CustomerResponse;
import com.lifat.CircuitsCourtsApi.service.AdresseService;
import com.lifat.CircuitsCourtsApi.service.ClientService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.parameters.P;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.Optional;

@CrossOrigin(origins = "http://localhost:3000")
@RestController
@RequestMapping("/api")
public class ClientController {


    @Autowired
    private ClientService clientService;

    @Autowired
    private AdresseService adresseService;

    @PreAuthorize("hasRole('ORGANISATEUR') or hasRole('ADMIN')")
    @GetMapping("/clients")
    public ResponseEntity<?> getClients() {
        Iterable<Client> clients = clientService.getClients();
        ArrayList<CustomerResponse> customerResponses = new ArrayList<>();

        for (Client client : clients) {
            CustomerResponse customerResponse = new CustomerResponse();
            customerResponse.setId(client.getId());
            customerResponse.setNom(client.getNom());
            customerResponse.setPrenom(client.getPrenom());
            customerResponse.setAdresse(client.getAdresse());
            customerResponse.setVille(client.getVille());
            customerResponse.setCodePostal(client.getCodePostal());
            customerResponse.setTelephone(client.getTelephone());
            customerResponse.setEmail(client.getEmail());

            Iterable<Adresse> adresses = adresseService.getAdressesByClient(client);
            customerResponse.setAdresses(adresses);

            customerResponses.add(customerResponse);
        }

        return ResponseEntity.ok(customerResponses);

    }

    @PreAuthorize("hasRole('ORGANISATEUR') or hasRole('ADMIN')")
    @GetMapping("/clients/{id}")
    public ResponseEntity<?> getClientById(@PathVariable Long id)  {
        Optional<Client> existingClient = clientService.getClient(id);
        if(!existingClient.isPresent()){
            return ResponseEntity.badRequest().body("le client n°" + id + "n'existe pas");
        }

        Client client = existingClient.get();

        CustomerResponse customerResponse = new CustomerResponse();
        customerResponse.setId(client.getId());
        customerResponse.setNom(client.getNom());
        customerResponse.setPrenom(client.getPrenom());
        customerResponse.setAdresse(client.getAdresse());
        customerResponse.setVille(client.getVille());
        customerResponse.setCodePostal(client.getCodePostal());
        customerResponse.setTelephone(client.getTelephone());
        customerResponse.setEmail(client.getEmail());

        Iterable<Adresse> adresses = adresseService.getAdressesByClient(client);
        customerResponse.setAdresses(adresses);


        return ResponseEntity.ok(customerResponse);
    }

    @PreAuthorize("hasRole('ORGANISATEUR') or hasRole('ADMIN')")
    @GetMapping("/clients/{id}/commandes")
    public ResponseEntity<?> getClientCommandes(@PathVariable Long id) throws Exception {
        Optional<Client> existingClient = clientService.getClient(id);
        if(existingClient.isEmpty()){
            return ResponseEntity.badRequest().body("le client n°"+ id+ "n'existe pas");
        }
            return ResponseEntity.ok(clientService.getClientCommandes(id));
    }

    @PreAuthorize("hasRole('ORGANISATEUR') or hasRole('ADMIN')")
    @PostMapping("/clients")
    public ResponseEntity<?> saveClient(@RequestBody Client client) throws Exception {
        return ResponseEntity.status(HttpStatus.CREATED).body(clientService.saveClient(client));
    }

    @PreAuthorize("hasRole('ORGANISATEUR') or hasRole('ADMIN')")
    @DeleteMapping("/clients/{id}")
    public ResponseEntity<?> deleteClient(@PathVariable Long id) {
        clientService.deleteClient(id);
        return ResponseEntity.ok("Client with id " + id + " has been deleted.");
    }

    @PreAuthorize("hasRole('ORGANISATEUR') or hasRole('ADMIN')")
    @PutMapping("/clients/{id}")
    public ResponseEntity<?> updateClient(@PathVariable Long id, @RequestBody Client client) throws Exception {
        if (client.getId() != id) {
            return ResponseEntity.badRequest().body("Id in path and in body are not the same.");
        } else if (clientService.getClient(id) == null) {
            return ResponseEntity.badRequest().body("Client with id " + id + " does not exist.");
        }

        return ResponseEntity.ok(clientService.updateClient(id, client));
    }
}
