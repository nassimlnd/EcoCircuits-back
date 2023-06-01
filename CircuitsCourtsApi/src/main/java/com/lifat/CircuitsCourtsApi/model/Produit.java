package com.lifat.CircuitsCourtsApi.model;

import javax.persistence.*;
import javax.validation.constraints.Digits;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Set;

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

    @Column(name = "reference")
    private String reference;

    @Column(name = "origine_production")
    private String origineProduction;

    @Column(name = "origine_transformation")
    private String origineTransformation;

    @Column(name = "agriculture")
    private String agriculture;

    @Column(name = "type_produit")
    private String typeProduit;

    @Column(name = "conditionnement")
    private String conditionnement;

    @Column(name = "dluo")
    private String dluo;

    @Min(0)
    @Column(name = "prix")
    @Digits(integer = 5, fraction = 2)
    private Float prix;

    @JsonIgnore
    @OneToMany(mappedBy = "producteur")
    private Set<ProduitsProducteurs> lesProducteurs;
}
