package com.lifat.CircuitsCourtsApi.model;

import javax.persistence.*;
import javax.validation.constraints.Digits;
import javax.validation.constraints.NotNull;

import lombok.Data;

@Data
@Entity
@Table(name = "produits")
public class Produit {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "libelle")
    @NotNull
    private String libelle;

    @Column(name = "prix")
    @Digits(integer = 5, fraction = 2)
    private Double prix;

    @Column(name = "description")
    @NotNull
    private String description;
}
