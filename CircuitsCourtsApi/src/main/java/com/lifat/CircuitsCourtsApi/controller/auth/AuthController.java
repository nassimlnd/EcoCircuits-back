package com.lifat.CircuitsCourtsApi.controller.auth;

import com.lifat.CircuitsCourtsApi.model.User;
import com.lifat.CircuitsCourtsApi.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@CrossOrigin(origins = "http://localhost:3000")
@RestController
@RequestMapping("/api/auth")
public class AuthController {

    @Autowired
    private UserService userService;

    @PostMapping("/login")
    public ResponseEntity<?> login(@RequestBody Map<String, Object> payload) {
        System.out.println("username: " + payload.get("username"));
        System.out.println("password: " + payload.get("password"));

        String username = (String) payload.get("username");
        String password = (String) payload.get("password");

        User user = userService.findByUsername(username);

        if (user == null || !user.getPassword().equals(password)) {
            return ResponseEntity.badRequest().body("Invalid username/password");
        } else {
            return ResponseEntity.ok(user);
        }
    }


}
