package com.lifat.CircuitsCourtsApi.controller;

import com.lifat.CircuitsCourtsApi.JWTEndPointsProtection.JwtUtil;
import com.lifat.CircuitsCourtsApi.model.Client;
import com.lifat.CircuitsCourtsApi.model.Commande;
import com.lifat.CircuitsCourtsApi.service.ClientService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

@CrossOrigin(origins = "http://localhost:3000")
@RestController
@RequestMapping("/api")
public class ClientController {

    @Autowired
    JwtUtil jwtUtil;
    @Autowired
    private ClientService clientService;

    @Secured("ROLE_ORGANISATEUR")
    @GetMapping("/clients")
    public ResponseEntity<?> getClients(@RequestParam String key) throws Exception {
         if(jwtUtil.isValidToken(key)){
            return ResponseEntity.ok(clientService.getClients());
        }else return ResponseEntity.badRequest().body("Invalid Token");
    }

    @GetMapping("/clients/{id}")
    public ResponseEntity<?> getClientById(@PathVariable Long id, @RequestParam String key) throws Exception {
        if(jwtUtil.isValidToken(key)){
            return ResponseEntity.ok(clientService.getClient(id));
        }else return ResponseEntity.badRequest().body("Invalid token");
    }

    @GetMapping("/clients/{id}/commandes")
    public ResponseEntity<?> getClientCommandes(@PathVariable Long id, @RequestParam String key) throws Exception {
        if(jwtUtil.isValidToken(key)){
            return ResponseEntity.ok(clientService.getClientCommandes(id));
        }else return ResponseEntity.badRequest().body("Invalid Token");
    }
}
