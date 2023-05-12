package com.lifat.CircuitsCourtsApi.controller;

import com.lifat.CircuitsCourtsApi.service.ClientService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
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
}
