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

    @Column(name = "tva")
    private String tva;

    @Column(name = "producteurs")
    private String producteurs;

    @Column(name = "reference")
    private String reference;

    @Column(name = "origine_production")
    private String origineProduction;

    @Column(name = "orgine_transformation")
    private String orgineTransformation;

    @Column(name = "agriculture")
    private String agriculture;

    @Column(name = "type_produit")
    private String typeProduit;

    @Column(name = "conditionnement")
    private String conditionnement;

    @Column(name = "prix")
    @Digits(integer = 5, fraction = 2)
    private Float prix;

    @Column(name = "description")
    private String description;
}
