package com.lifat.CircuitsCourtsApi.model;

import jakarta.persistence.*;
import lombok.Data;

@Data
@Entity
@Table(name = "produits")
public class Produit {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "libelle")
    private String libelle;

    @Column(name = "prix")
    private Double prix;

    @Column(name = "description")
    private String description;
}
