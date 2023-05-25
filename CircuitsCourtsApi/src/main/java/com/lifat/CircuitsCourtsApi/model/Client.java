package com.lifat.CircuitsCourtsApi.model;

import javax.persistence.*;
import javax.validation.constraints.Email;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.Pattern;

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

   // @Min(5)
   // @Max(5)
    @Column(name = "code_postal")
    private Integer codePostal;


    @Column(name = "ville")
    private String ville;

    //@Min(10)
    //@Max(10)
    @Column(name = "telephone")
    private String telephone;

    @Email
    @Column(name = "email")
    private String email;

}
