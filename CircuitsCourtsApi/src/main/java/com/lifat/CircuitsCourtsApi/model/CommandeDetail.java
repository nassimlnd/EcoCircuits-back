package com.lifat.CircuitsCourtsApi.model;

import javax.persistence.*;
import javax.validation.constraints.NotNull;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@Entity
@Table(name = "commande_details")
public class CommandeDetail {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "id_commande")
    @NotNull
    private Long idCommande;

    @Column(name = "id_produit")
    @NotNull
    private Long idProduit;

    @Column(name = "quantite")
    private Double quantite;

}
