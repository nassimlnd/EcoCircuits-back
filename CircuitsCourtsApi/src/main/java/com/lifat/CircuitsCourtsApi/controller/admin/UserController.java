package com.lifat.CircuitsCourtsApi.controller.admin;

import com.lifat.CircuitsCourtsApi.model.ERole;
import com.lifat.CircuitsCourtsApi.model.Role;
import com.lifat.CircuitsCourtsApi.model.User;
import com.lifat.CircuitsCourtsApi.payload.request.UserUpdateRequest;
import com.lifat.CircuitsCourtsApi.repository.RoleRepository;
import com.lifat.CircuitsCourtsApi.service.RoleService;
import com.lifat.CircuitsCourtsApi.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.*;

import java.util.HashSet;
import java.util.Set;

@RestController
@RequestMapping("/api/admin")
public class UserController {

    @Autowired
    private RoleService roleService;

    @Autowired
    private UserService userService;

    @Autowired
    private RoleRepository roleRepository;

    @Autowired
    PasswordEncoder passwordEncoder;

    @PreAuthorize("hasRole('ADMIN')")
    @GetMapping("/users")
    public ResponseEntity<?> getUsers() {
        return ResponseEntity.ok(userService.findAll());
    }

    @PostMapping("/users")
    public User saveUser(@RequestBody User user) {
        return userService.save(user);
    }

    @GetMapping("/users/{id}")
    public User getUser(@PathVariable Long id) {
        return userService.findById(id);
    }

    @DeleteMapping("/users/{id}")
    public void deleteUser(@PathVariable Long id) {
        userService.deleteById(id);
    }

    @PutMapping("/users/{id}")
    public User updateUser(@PathVariable Long id, @RequestBody UserUpdateRequest user) {
        User user1 = userService.findById(id);



        user1.setUsername(user.getUsername());
        user1.setEmail(user.getEmail());

        Set<String> strRoles = user.getRoles();
        Set<Role> roles = new HashSet<>();
        strRoles.forEach(role -> {
            switch (role) {
                case "admin":
                    Role adminRole = roleRepository.findByRole(ERole.ROLE_ADMIN.name())
                            .orElseThrow(() -> new RuntimeException("Error: Role is not found."));
                    roles.add(adminRole);

                    break;
                case "orga":
                    Role orgaRole = roleRepository.findByRole(ERole.ROLE_ORGANISATEUR.name())
                            .orElseThrow(() -> new RuntimeException("Error: Role is not found."));
                    roles.add(orgaRole);

                    break;
                case "prod":
                    Role prodRole = roleRepository.findByRole(ERole.ROLE_PRODUCTEUR.name())
                            .orElseThrow(() -> new RuntimeException("Error: Role is not found."));
                    roles.add(prodRole);
                    break;
            }
        });

        user1.setRoles(roles);

        user1.setPassword(passwordEncoder.encode(user.getPassword()));
        return userService.save(user1);
    }

    @GetMapping("/roles/{id}/users")
    public ResponseEntity<?> getUsersByRole(@PathVariable Long id) {
        return ResponseEntity.ok(roleService.getUsersByRole(id));
    }

    @GetMapping("/users/usersRoles")
    public ResponseEntity<?> getAllUsersWithRole() {
        return userService.getAllUsersWithRole();
    }

}
