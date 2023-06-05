package com.lifat.CircuitsCourtsApi.model;

import lombok.Data;

import javax.persistence.*;

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

}
