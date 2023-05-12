package com.lifat.CircuitsCourtsApi.controller.auth;

import com.google.common.hash.Hashing;
import com.lifat.CircuitsCourtsApi.JWTEndPointsProtection.JwtUtil;
import com.lifat.CircuitsCourtsApi.model.User;
import com.lifat.CircuitsCourtsApi.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.nio.charset.StandardCharsets;
import java.util.Map;

@CrossOrigin(origins = "http://localhost:3000")
@RestController
@RequestMapping("/api/auth")
public class AuthController {

    @Autowired
    private UserService userService;
    @Autowired
    JwtUtil jwt;

    @PostMapping("/login")
    public ResponseEntity<?> login(@RequestBody Map<String, Object> payload) {
        String username = (String) payload.get("username");
        String password = Hashing.sha256().hashString((String) payload.get("password"), StandardCharsets.UTF_8).toString();

        System.out.println("Hashed password : " + password);

        User user = userService.findByUsername(username);


        if (user == null || !user.getPassword().equals(password)) {
            return ResponseEntity.badRequest().body("Invalid username/password");
        } else {
            String token =  jwt.generateNewJwtToken(username, password);
            user.setToken(token);
            userService.save(user);
            return ResponseEntity.ok(user);
        }
    }


}
