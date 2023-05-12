package com.lifat.CircuitsCourtsApi.repository;

import com.lifat.CircuitsCourtsApi.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {

    Optional<User> findByUsername(String username);

    User findByToken(String Token);

    Boolean existsByUsername(String username);

    Boolean existsByEmail(String email);
}
