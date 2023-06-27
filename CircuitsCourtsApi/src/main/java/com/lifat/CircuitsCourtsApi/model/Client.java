package com.lifat.CircuitsCourtsApi.model;

import javax.persistence.*;
import javax.validation.constraints.Email;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.Pattern;

import lombok.Data;

import java.util.Collection;

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

    @Email
    @Column(name = "email")
    private String email;

    @Column(name = "latitude", scale = 6)
    private double latitude;

    @Column(name = "longitude", scale = 6)
    private double longitude;

    @OneToMany(mappedBy = "client")
    private Collection<Adresse> adresses;
}
