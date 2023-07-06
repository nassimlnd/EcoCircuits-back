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

/**
 * End point de l'api pour la gestion des utilisateur enregistrés dans la BD.
 */
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

    /**
     * @return tous les users de la BD
     */
    @PreAuthorize("hasRole('ADMIN')")
    @GetMapping("/users")
    public ResponseEntity<?> getUsers() {
        return ResponseEntity.ok(userService.findAll());
    }

    /**
     * Enrehistre un compte dans la bd.
     * @return l'objet enregistré dans la BD.
     */
    @PostMapping("/users")
    public User saveUser(@RequestBody User user) {
        return userService.save(user);
    }

    /**
     * Cherche un user via son id
     * @param id
     * @return l'utilisateur en question
     */
    @GetMapping("/users/{id}")
    public User getUser(@PathVariable Long id) {
        return userService.findById(id);
    }

    /**
     * supprime un user via son id
     * @param id
     */
    @DeleteMapping("/users/{id}")
    public void deleteUser(@PathVariable Long id) {
        userService.deleteById(id);
    }

    /**
     * modifie un user via son id
     * @param id
     * @param user
     * @return le nv user
     */
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

    /**
     * cherche les users par leurs rôles
     * @param id
     * @return les users
     */
    @GetMapping("/roles/{id}/users")
    public ResponseEntity<?> getUsersByRole(@PathVariable Long id) {
        return ResponseEntity.ok(roleService.getUsersByRole(id));
    }

    /**
     * @return les users avec leurs roles
     */
    @GetMapping("/users/usersRoles")
    public ResponseEntity<?> getAllUsersWithRole() {
        return userService.getAllUsersWithRole();
    }

}
