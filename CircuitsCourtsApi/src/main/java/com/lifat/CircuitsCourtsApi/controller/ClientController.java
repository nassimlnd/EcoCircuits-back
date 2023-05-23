package com.lifat.CircuitsCourtsApi.controller;

import com.lifat.CircuitsCourtsApi.model.Client;
import com.lifat.CircuitsCourtsApi.service.ClientService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.parameters.P;
import org.springframework.web.bind.annotation.*;

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
            return ResponseEntity.ok(clientService.getClient(id));
    }

    @PreAuthorize("hasRole('ORGANISATEUR') or hasRole('ADMIN')")
    @GetMapping("/clients/{id}/commandes")
    public ResponseEntity<?> getClientCommandes(@PathVariable Long id) throws Exception {
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
}
