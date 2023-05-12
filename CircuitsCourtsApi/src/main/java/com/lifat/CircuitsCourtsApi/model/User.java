package com.lifat.CircuitsCourtsApi.model;

import javax.persistence.*;
import lombok.Data;

@Entity
@Data
@Table(name = "users")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Column
    private String username;
    @Column
    private String password;
    @Column
    private Role role;
    @Column
    private String token;


}
