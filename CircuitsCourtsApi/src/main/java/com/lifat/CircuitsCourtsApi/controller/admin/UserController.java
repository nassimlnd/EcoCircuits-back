package com.lifat.CircuitsCourtsApi.controller.admin;

import com.lifat.CircuitsCourtsApi.model.User;
import com.lifat.CircuitsCourtsApi.service.RoleService;
import com.lifat.CircuitsCourtsApi.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/admin")
public class UserController {

    @Autowired
    private RoleService roleService;

    @Autowired
    private UserService userService;

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
    public User updateUser(@PathVariable Long id, @RequestBody User user) {
        return userService.save(user);
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
