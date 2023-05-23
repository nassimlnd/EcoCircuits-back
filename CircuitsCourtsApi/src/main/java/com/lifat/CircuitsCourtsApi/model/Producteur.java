package com.lifat.CircuitsCourtsApi.model;

import javax.persistence.*;
import javax.validation.constraints.Digits;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotNull;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;

import java.util.ArrayList;
import java.util.Set;


@Entity
@Table(name = "producteurs")
@Data
public class Producteur {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id_Producteur;


    @Column(name = "description")
    private String description;

    @Column(name = "tags")
    private String tags;

    @Column(name = "libelle")
    @NotNull
    private String libelle;

    @Column(name = "adresse_postale")
    @NotNull
    private String adresse;

    @Column(name = "mail")
    private String mail;

    @Column(name = "rayon_livraison")
    private Float rayon_Livraison;


    @JsonIgnore
    @OneToMany(mappedBy = "produit")
    private Set<ProduitsProducteurs> lesProduits;
}
