package com.lifat.CircuitsCourtsApi.model;
import lombok.Data;
import javax.persistence.*;


@Data
@Entity
@Table(name = "produits_producteurs")
public class ProduitsProducteurs {
    @EmbeddedId
    private ProduitProducteurId id;

    @ManyToOne
    @MapsId("id_Producteur")
    @JoinColumn(name = "id_producteur")
    private Producteur producteur;

    @ManyToOne
    @MapsId("id")
    @JoinColumn(name = "id_produit")
    private Produit produit;

    @Column(name = "quantite")
    private Float quantite;


}


