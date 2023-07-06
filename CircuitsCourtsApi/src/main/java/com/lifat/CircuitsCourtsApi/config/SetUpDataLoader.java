package com.lifat.CircuitsCourtsApi.config;

import com.lifat.CircuitsCourtsApi.model.Privilege;
import com.lifat.CircuitsCourtsApi.model.Role;
import com.lifat.CircuitsCourtsApi.model.User;
import com.lifat.CircuitsCourtsApi.repository.PrivilegeRepository;
import com.lifat.CircuitsCourtsApi.repository.RoleRepository;
import com.lifat.CircuitsCourtsApi.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

import javax.transaction.Transactional;
import java.util.*;

/**
 * Création et gestion des privilèges.
 * Utilisation du pattern RBAC (Role based access controls) dou l'importance des privilèges.
 */
@Component
public class SetUpDataLoader implements ApplicationListener<ContextRefreshedEvent> {

    boolean alreadySetup = false;

    @Autowired
    UserRepository userRepository;

    @Autowired
    RoleRepository roleRepository;

    @Autowired
    PrivilegeRepository privilegeRepository;

    @Autowired
    private PasswordEncoder passwordEncoder;



    @Override
    public void onApplicationEvent(ContextRefreshedEvent event) {

        if (alreadySetup)
            return;
        Privilege readPrivilege
                = createPrivilegeIfNotFound("READ_PRIVILEGE");
        Privilege writePrivilege
                = createPrivilegeIfNotFound("WRITE_PRIVILEGE");


        List<Privilege> adminPrivileges = Arrays.asList(
                readPrivilege, writePrivilege);
        createRoleIfNotFound("ROLE_ADMIN", adminPrivileges);
        createRoleIfNotFound("ROLE_PRODUCTEUR", Arrays.asList(readPrivilege));
        createRoleIfNotFound("ROLE_ORGANISATEUR", Arrays.asList(readPrivilege, writePrivilege));
    }

    @Transactional
    Privilege createPrivilegeIfNotFound(String name) {

        Privilege privilege = privilegeRepository.findByName(name);
        if (privilege == null) {
            privilege = new Privilege(name);
            privilegeRepository.save(privilege);
        }
        return privilege;
    }

    @Transactional
    Role createRoleIfNotFound(
            String name, Collection<Privilege> privileges) {

        Role role = roleRepository.findByRole(name).get();
        if (role == null) {
            role = new Role(name);
            role.setPrivileges(privileges);
            roleRepository.save(role);
        }
        return role;
    }
}
