package com.lifat.CircuitsCourtsApi.model;

import javax.persistence.*;
import javax.validation.constraints.*;

import lombok.Data;

@Entity
@Data
@Table(name = "hub")
public class Hub {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    //@Pattern(regexp = "[a-zA-Z0-9\\s\\p{Punct}]+$")
    @Column(name = "libelle")
    @NotNull
    private String libelle;

    //@Pattern(regexp = "^[0-9]{1,5}\\\\s[a-zA-ZÀ-ÿ0-9\\\\s'’-]+$")
    @Column(name = "adresse")
    @NotNull
    private String adresse;

    @Pattern(regexp = "^[a-zA-ZÀ-ÿ\\s'’-]+$")
    @Column(name = "ville")
    @NotNull
    private String ville;

    //@Min(5)
    //@Max(5)
    @Column(name = "code_postal")
    @Digits(integer = 5, fraction = 0)
    private int code_postal;


}
