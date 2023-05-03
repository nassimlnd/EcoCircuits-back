package com.lifat.CircuitsCourtsApi.model;

import jakarta.persistence.*;
import lombok.Data;

@Data
@Entity
@Table(name = "commande_details")
public class CommandeDetail {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "id_commande")
    private Long idCommande;

    @Column(name = "id_produit")
    private Long idProduit;

    @Column(name = "quantite")
    private Double quantite;

}
