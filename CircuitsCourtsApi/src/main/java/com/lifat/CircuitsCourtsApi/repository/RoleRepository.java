package com.lifat.CircuitsCourtsApi.repository;

import com.lifat.CircuitsCourtsApi.model.Role;
import org.springframework.data.repository.CrudRepository;

import java.util.Optional;

public interface RoleRepository extends CrudRepository<Role, Long> {

    Optional<Role> findByRole(String role);

}
