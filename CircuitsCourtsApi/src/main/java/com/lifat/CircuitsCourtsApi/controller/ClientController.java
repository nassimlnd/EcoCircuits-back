package com.lifat.CircuitsCourtsApi.controller;

import com.lifat.CircuitsCourtsApi.model.Client;
import com.lifat.CircuitsCourtsApi.service.ClientService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.Optional;

@CrossOrigin(origins = "http://localhost:3000")
@RestController
@RequestMapping("/api")
public class ClientController {


    @Autowired
    private ClientService clientService;

    @PreAuthorize("hasRole('ORGANISATEUR') or hasRole('ADMIN')")
    @GetMapping("/clients")
    public ResponseEntity<?> getClients() {
            return ResponseEntity.ok(clientService.getClients());

    }

    @PreAuthorize("hasRole('ORGANISATEUR') or hasRole('ADMIN')")
    @GetMapping("/clients/{id}")
    public ResponseEntity<?> getClientById(@PathVariable Long id)  {
        Optional<Client> existingClient = clientService.getClient(id);
        if(existingClient.isEmpty()){
            return ResponseEntity.badRequest().body("le client n°" + id + "n'existe pas");
        }
        return ResponseEntity.ok(clientService.getClient(id));
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
}
