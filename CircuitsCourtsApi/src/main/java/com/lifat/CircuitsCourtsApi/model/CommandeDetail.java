package com.lifat.CircuitsCourtsApi.model;

import javax.persistence.*;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@Entity
@Table(name = "commande_details")
/**
 * Le détail d'une correspond un produit de la commande et sa quantité, il peut y avoir plusieurs CommandeDetail par Commande.
 */
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

    @Min(0)
    @Column(name = "quantite")
    private Float quantite;

}
