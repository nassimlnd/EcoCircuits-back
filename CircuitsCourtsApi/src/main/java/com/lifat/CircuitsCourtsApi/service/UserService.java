package com.lifat.CircuitsCourtsApi.service;

import com.lifat.CircuitsCourtsApi.model.Role;
import com.lifat.CircuitsCourtsApi.repository.UserRepository;
import com.lifat.CircuitsCourtsApi.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class UserService {

    @Autowired
    private UserRepository userRepository;

    /*public User findByUsername(String username) {
        return userRepository.findByUsername(username);
    }*/

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

}
