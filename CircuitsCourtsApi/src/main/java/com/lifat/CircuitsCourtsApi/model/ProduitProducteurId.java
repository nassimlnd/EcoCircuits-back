package com.lifat.CircuitsCourtsApi.model;

import lombok.AllArgsConstructor;
import lombok.Data;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import java.io.Serializable;

@AllArgsConstructor
@Data
@Embeddable
public class ProduitProducteurId implements Serializable {

    @Column(name = "id_produit")
    private Long idProduit;

    @Column(name = "id_producteur")
    private Long idProducteur;
}
