package com.lifat.CircuitsCourtsApi.service;

import com.lifat.CircuitsCourtsApi.model.Role;
import com.lifat.CircuitsCourtsApi.payload.response.RoleResponse;
import com.lifat.CircuitsCourtsApi.payload.response.UserResponse;
import com.lifat.CircuitsCourtsApi.repository.RoleRepository;
import com.lifat.CircuitsCourtsApi.repository.UserRepository;
import com.lifat.CircuitsCourtsApi.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
public class UserService {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private RoleRepository roleRepository;

    public User save(User user) {
        return userRepository.save(user);
    }

    public Iterable<User> findAll() {
        return userRepository.findAll();
    }

    public void deleteById(Long id) {
        userRepository.deleteById(id);
    }

    public User findById(Long id) {
        return userRepository.findById(id).get();
    }

    public ResponseEntity<?> getAllUsersWithRole() {
        ArrayList<UserResponse> userResponses = new ArrayList<>();

        for (User user : userRepository.findAll()) {
            ArrayList<RoleResponse> roles = new ArrayList<>();
            for (Integer roleId : userRepository.findRolesById(user.getId())) {
                Role role = roleRepository.findById(Long.valueOf(roleId)).get();
                RoleResponse roleResponse = new RoleResponse(role.getId(), role.getRole());
                roles.add(roleResponse);
            }
            userResponses.add(new UserResponse(user.getId(), user.getUsername(), user.getEmail(), roles));
        }
        return ResponseEntity.ok(userResponses);
    }

}
