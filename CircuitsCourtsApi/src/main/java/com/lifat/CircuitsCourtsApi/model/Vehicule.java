package com.lifat.CircuitsCourtsApi.model;

import javax.persistence.*;
import lombok.Data;

@Data
@Entity
@Table(name = "vehicules")
public class Vehicule {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id_vehicule;

    @Column(name = "matricule")
    private String matricule;

    @Column(name = "type")
    private String type;

    @Column(name = "capacite")
    private float capacite;

    @Column(name = "id_producteur")
    private int id_producteur;




}
