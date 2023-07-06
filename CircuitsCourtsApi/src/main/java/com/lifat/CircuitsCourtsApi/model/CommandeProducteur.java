package com.lifat.CircuitsCourtsApi.model;

import javax.persistence.*;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@Entity
@Table(name = "commande_producteur")
@NoArgsConstructor
/**
 * L'objet CommandeProducteur est la partie de la commande destinée à un producteur.
 * Un détail de commande indique la quantitée d'un produit et la CommandeProducteur indique quel producteur satisfait la connamdeDetail et
 * et quelle quantitée de la commandeDetail il satisfait.
 * Il peut y avoir plusieurs commandesProducteur par commandeDetail.
 */
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

    @Min(0)
    @Column(name = "quantite")
    private Float quantite;

}
