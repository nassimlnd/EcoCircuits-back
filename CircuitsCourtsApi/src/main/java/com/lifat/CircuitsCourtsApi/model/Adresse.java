package com.lifat.CircuitsCourtsApi.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;

import javax.persistence.*;
import javax.validation.constraints.Max;

@Entity
@Data
@Table(name = "adresses")
public class Adresse {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "rue")
    private String rue;
    @Column(name = "code_postal")
    private String codePostal;
    @Column(name = "ville")
    private String ville;

    @Column(name = "latitude")
    private double latitude;

    @Column(name = "longitude")
    private double longitude;

    @JsonIgnore
    @ManyToOne
    @JoinColumn(name = "id_client")
    private Client client;
}
