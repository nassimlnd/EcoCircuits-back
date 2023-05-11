package com.lifat.CircuitsCourtsApi.controller;

import com.lifat.CircuitsCourtsApi.JWTEndPointsProtection.JwtUtil;
import com.lifat.CircuitsCourtsApi.model.Hub;
import com.lifat.CircuitsCourtsApi.service.HubSrevice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
@CrossOrigin(origins = "http://localhost:3000")
@RestController
@RequestMapping("/api")
public class HubController {

    @Autowired
    JwtUtil jwtUtil;
    @Autowired
    private HubSrevice hubSrevice;

    @GetMapping("/hubs")
    public ResponseEntity<?> getAllHubs(@RequestParam String key) throws Exception {
        if (jwtUtil.isValidToken(key)) {
            return ResponseEntity.ok(hubSrevice.getAllHubs());
        } else {
            return ResponseEntity.badRequest().body("Invalid Token");
        }
    }

    @GetMapping("/hubs/{id}")
    public ResponseEntity<?> getHubById(@PathVariable Long id, @RequestParam String key) throws Exception {
        if (jwtUtil.isValidToken(key)) {
            return ResponseEntity.ok(hubSrevice.getHubById(id));
        } else {
            return ResponseEntity.badRequest().body("Invalid Token");
        }
    }

    @PostMapping("/hubs")
    public ResponseEntity<?> saveHub(@RequestBody Hub hub, @RequestParam String key) throws Exception {
        if (jwtUtil.isValidToken(key)) {
            return ResponseEntity.ok(hubSrevice.saveHub(hub));
        } else {
            return ResponseEntity.badRequest().body("Invalid Token");
        }
    }

    @DeleteMapping("/hub/{id}")
    public ResponseEntity<?> deletHubById(@PathVariable Long id, @RequestParam String key) throws Exception {
        if (jwtUtil.isValidToken(key)) {
            hubSrevice.deletHubById(id);
            return ResponseEntity.ok("Hub with ID " + id + " was deleted.");
        } else {
            return ResponseEntity.badRequest().body("Invalid Token");
        }
    }
}
