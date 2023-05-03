package com.lifat.CircuitsCourtsApi.model;

import jakarta.persistence.*;
import lombok.Data;
import org.hibernate.grammars.hql.HqlParser;

@Entity
@Table(name = "producteurs")
@Data
public class Producteur {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long idProducteur;

    @Column(name = "siret")
    private Long siret;

    @Column(name = "libelle")
    private String libelle;

    @Column(name = "adresse")
    private String adresse;

    @Column(name = "code_postal")
    private int codePostal;

    @Column(name = "mail")
    private String mail;


    @Column(name = "rayon_livraison")
    private float rayonLivraison;

}
