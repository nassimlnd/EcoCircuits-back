package com.lifat.CircuitsCourtsApi.model;

import javax.persistence.*;
import javax.validation.constraints.Digits;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotNull;

import lombok.Data;

import java.util.Set;


@Entity
@Table(name = "producteurs")
@Data
public class Producteur {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id_Producteur;

    @Column(name = "siret")
    @Digits(integer = 14, fraction = 0)
    private Long siret;

    @Column(name = "libelle")
    @NotNull
    private String libelle;

    @Column(name = "adresse")
    @NotNull
    private String adresse;

    @Column(name = "code_postal")
    @Digits(integer = 5, fraction = 0)
    private int code_postal;

    @Column(name = "mail")
    @Email
    private String mail;

    @Column(name = "rayon_livraison")
    @Digits(integer = 3, fraction = 0)
    private float rayon_Livraison;

}
