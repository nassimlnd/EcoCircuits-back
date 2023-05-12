package com.lifat.CircuitsCourtsApi.model;

import javax.persistence.*;
import javax.validation.constraints.Digits;
import javax.validation.constraints.NotNull;

import lombok.Data;

@Entity
@Data
@Table(name = "hub")
public class Hub {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "libelle")
    @NotNull
    private String libelle;

    @Column(name = "adresse")
    @NotNull
    private String adresse;

    @Column(name = "ville")
    @NotNull
    private String ville;

    @Column(name = "code_postal")
    @Digits(integer = 5, fraction = 0)
    private int code_postal;


}
