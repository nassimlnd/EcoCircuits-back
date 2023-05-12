package com.lifat.CircuitsCourtsApi.model;

import javax.persistence.*;
import lombok.Data;


@Entity
@Table(name = "producteurs")
@Data
public class Producteur {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id_Producteur;

    @Column(name = "siret")
    private Long siret;

    @Column(name = "libelle")
    private String libelle;

    @Column(name = "adresse")
    private String adresse;

    @Column(name = "code_postal")
    private int code_postal;

    @Column(name = "mail")
    private String mail;


    @Column(name = "rayon_livraison")
    private float rayon_Livraison;

}
