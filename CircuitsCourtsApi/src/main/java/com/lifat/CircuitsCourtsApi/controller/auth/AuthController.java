package com.lifat.CircuitsCourtsApi.controller.auth;

import com.lifat.CircuitsCourtsApi.model.ERole;
import com.lifat.CircuitsCourtsApi.model.Role;
import com.lifat.CircuitsCourtsApi.model.User;
import com.lifat.CircuitsCourtsApi.payload.request.LoginRequest;
import com.lifat.CircuitsCourtsApi.payload.request.SignupRequest;
import com.lifat.CircuitsCourtsApi.payload.response.JwtResponse;
import com.lifat.CircuitsCourtsApi.payload.response.MessageResponse;
import com.lifat.CircuitsCourtsApi.repository.RoleRepository;
import com.lifat.CircuitsCourtsApi.repository.UserRepository;
import com.lifat.CircuitsCourtsApi.security.jwt.JwtUtils;
import com.lifat.CircuitsCourtsApi.security.services.UserDetailsImpl;
import com.lifat.CircuitsCourtsApi.service.UserService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;


@RestController
@Slf4j
@RequestMapping("/api/auth")
/**
 * Gère l'authentification à l'api et la création d'un compte.
 * Pour pouvoir communiquer avec l'api il faut avoir un compte.
 */
public class AuthController {

    @Autowired
    AuthenticationManager authenticationManager;
    @Autowired
    UserRepository userRepository;
    @Autowired
    RoleRepository roleRepository;

    @Autowired
    PasswordEncoder encoder;

    @Autowired
    private UserService userService;
    @Autowired
    JwtUtils jwtUtils;

    /**
     * Valide ou non la connexion à l'api
     * Lors de la validation crée un JWT et l'encode pour sécuriser la discution avec l'utilisateur connecté.
     * @param loginRequest
     * @return le JWT
     */
    @PostMapping("/login")
    public ResponseEntity<?> login(@Valid @RequestBody LoginRequest loginRequest) {
        Authentication authentication = authenticationManager.authenticate(
                new UsernamePasswordAuthenticationToken(loginRequest.getUsername(), loginRequest.getPassword()));

        SecurityContextHolder.getContext().setAuthentication(authentication);
        String jwt = jwtUtils.generateJwtToken(authentication);

        UserDetailsImpl userDetails = (UserDetailsImpl) authentication.getPrincipal();
        List<String> roles = userDetails.getAuthorities().stream()
                .map(item -> item.getAuthority())
                .collect(Collectors.toList());

        log.info("User " + loginRequest.getUsername() + " logged in using token : " + jwt);

        return ResponseEntity.ok(new JwtResponse(jwt,
                userDetails.getId(),
                userDetails.getUsername(),
                userDetails.getEmail(),
                roles));
    }

    /**
     * crée un compte utilisateur puis lui attribue son rôle et ses privlièges.
     * @param signUpRequest
     * @return un message de validation de la creation du compte.
     */
    @PostMapping("/signup")
    public ResponseEntity<?> registerUser(@Valid @RequestBody SignupRequest signUpRequest) {
        if (userRepository.existsByUsername(signUpRequest.getUsername())) {
            return ResponseEntity
                    .badRequest()
                    .body(new MessageResponse("Error: Username is already taken!"));
        }

        if (userRepository.existsByEmail(signUpRequest.getEmail())) {
            return ResponseEntity
                    .badRequest()
                    .body(new MessageResponse("Error: Email is already in use!"));
        }

        // Create new user's account
        User user = new User(signUpRequest.getUsername(),
                signUpRequest.getEmail(),
                encoder.encode(signUpRequest.getPassword()));

        Set<String> strRoles = signUpRequest.getRole();
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


        user.setRoles(roles);
        userRepository.save(user);

        return ResponseEntity.status(HttpStatus.CREATED).body(new
                MessageResponse("User registered successfully!"));
    }


}
