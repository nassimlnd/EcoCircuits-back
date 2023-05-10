package com.lifat.CircuitsCourtsApi.controller.auth;

import com.lifat.CircuitsCourtsApi.model.User;
import com.lifat.CircuitsCourtsApi.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/auth")
public class AuthController {

    @Autowired
    private UserService userService;

    @PostMapping("/login")
    public ResponseEntity<?> login(@RequestBody String username, @RequestBody String password) {
        System.out.println("username: " + username);
        System.out.println("password: " + password);

        User user = userService.findByUsername(username);

        if (user == null || !user.getPassword().equals(password)) {
            return ResponseEntity.badRequest().body("Invalid username/password");
        } else {
            return ResponseEntity.ok(user);
        }
    }


}
