package com.lifat.CircuitsCourtsApi.security.services;

import com.lifat.CircuitsCourtsApi.model.Privilege;
import com.lifat.CircuitsCourtsApi.model.Role;
import com.lifat.CircuitsCourtsApi.model.User;
import com.lifat.CircuitsCourtsApi.repository.PrivilegeRepository;
import com.lifat.CircuitsCourtsApi.repository.RoleRepository;
import com.lifat.CircuitsCourtsApi.repository.UserRepository;
import com.lifat.CircuitsCourtsApi.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.security.access.hierarchicalroles.RoleHierarchy;
import org.springframework.security.access.hierarchicalroles.RoleHierarchyImpl;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.web.access.expression.DefaultWebSecurityExpressionHandler;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.PrimitiveIterator;

@Service
public class UserDetailsServiceImpl implements UserDetailsService {

    @Autowired
    UserRepository userRepository;

    @Autowired
    UserService userService;

    @Autowired
    MessageSource messageSource;

    @Autowired
    RoleRepository roleRepository;

    @Override
    @Transactional
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        User user = userRepository.findByUsername(username)
                .orElseThrow(() -> new UsernameNotFoundException("User Not Found with username: " + username));

        return UserDetailsImpl.build(user);
    }


    //renvoie les autoritées associées aux roles.
    private Collection<? extends GrantedAuthority> getAutorities(Collection<Role> roles){
        return getGrantedAutorities(getPrivileges(roles));
    }


    //renvoi tous les privileges associés a tous les roles de la collection passée en paramètre.
    private List<String> getPrivileges(Collection<Role> roles){
        List<String> privileges = new ArrayList<>();
        List<Privilege> collection = new ArrayList<>();
        //boucle sur tous les roles de la collection pour ajouter tous leurs privileges dans la List<Privilege>  collection.
        for(Role role : roles){
            privileges.add(role.getName());
            collection.addAll(role.getPrivileges());
        }
        //parcour tous les privileges de collection, pour chaque privilège ajoute son nom dans la collection.
        for (Privilege item: collection) {
            privileges.add(item.getName());
        }
        return privileges;
    }

    //renvoi les autorités associées aux privileges.
    private List<GrantedAuthority> getGrantedAutorities(List<String> privileges){
        List<GrantedAuthority> authorities = new ArrayList<>();
        for (String privilege : privileges) {
            authorities.add(new SimpleGrantedAuthority(privilege));
        }
        return authorities;
    }

    /***
     *  création d'un bean qui établit la hierarchie entre les différents roles
     *  le ROLE_ADMIN contient les privileges du ROLE_ORGANISATEUR qui lui contient les privileges du ROLE_USER
     *  ADMIN a tous les privileges
     *  ORGANISATEUR a ses privileges + les prvileges USER
     *  USER a seulement ses privileges
     * @return la hierarchie
     */
    @Bean
    public RoleHierarchy roleHierarchy(){
        RoleHierarchyImpl roleHierarchy = new RoleHierarchyImpl();
        String hierarchiy = "ROLE_ADMIN > ROLE_ORGANISATEUR \n ROLE_ORGANISATEUR > ROLE_USER";
        roleHierarchy.setHierarchy(hierarchiy);
        return roleHierarchy;
    }

    /***
     * Permet d'etablir les les toles lors des requetes.
     * @return expression handler
     */
    @Bean
    public DefaultWebSecurityExpressionHandler webSecurityExpressionHandlerRole(){
        DefaultWebSecurityExpressionHandler expressionHandler = new DefaultWebSecurityExpressionHandler();
        expressionHandler.setRoleHierarchy(roleHierarchy());
        return expressionHandler;
    }


}
