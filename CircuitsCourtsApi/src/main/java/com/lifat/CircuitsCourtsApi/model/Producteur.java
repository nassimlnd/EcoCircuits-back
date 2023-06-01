package com.lifat.CircuitsCourtsApi.model;

import javax.persistence.*;
import javax.validation.constraints.Digits;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

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

    @Pattern(regexp = "^[a-zA-Z0-9\\s\\p{Punct}]+$")
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

    @Column(name = "latitude", scale = 6)
    private Double latitude;

    @Column(name ="longitude", scale = 6)
    private Double longitude;

    @JsonIgnore
    @OneToMany(mappedBy = "produit")
    private Set<ProduitsProducteurs> lesProduits;
}
