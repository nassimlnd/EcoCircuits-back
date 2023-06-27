package com.lifat.CircuitsCourtsApi.model;

import javax.persistence.*;
import javax.validation.constraints.Digits;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

import lombok.Data;

@Data
@Entity
@Table(name = "vehicules")
public class Vehicule {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id_vehicule;

    @Column(name = "matricule")
    @NotNull
    private String matricule;

    @Column(name = "type")
    @NotNull
    private String type;

    @Column(name = "capacite")
    @Digits(integer = 5, fraction = 2)
    private float capacite;

    @Column(name = "id_producteur")
    @NotNull
    @Digits(integer = 10, fraction = 0)
    private int id_producteur;

}
