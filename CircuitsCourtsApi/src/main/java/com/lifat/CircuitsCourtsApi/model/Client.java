package com.lifat.CircuitsCourtsApi.model;

import jakarta.persistence.*;
import lombok.Data;

@Data
@Entity
@Table(name = "clients")
public class Client {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "nom")
    private String nom;

    @Column(name = "prenom")
    private String prenom;

    @Column(name = "adresse")
    private String adresse;

    @Column(name = "code_postal")
    private Integer codePostal;

    @Column(name = "ville")
    private String ville;

    @Column(name = "telephone")
    private String telephone;

    @Column(name = "email")
    private String email;

}
