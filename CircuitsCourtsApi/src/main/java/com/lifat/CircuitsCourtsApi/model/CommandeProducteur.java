package com.lifat.CircuitsCourtsApi.model;

import javax.persistence.*;
import javax.validation.constraints.NotNull;

import lombok.Data;

@Data
@Entity
@Table(name = "commande_producteur")
public class CommandeProducteur {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "id_commande_details")
    @NotNull
    private Long idCommandeDetails;

    @Column(name = "id_producteur")
    @NotNull
    private Long idProducteur;

    @Column(name = "quantite")
    private Double quantite;

}
