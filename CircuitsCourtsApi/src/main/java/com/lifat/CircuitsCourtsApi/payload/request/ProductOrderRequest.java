package com.lifat.CircuitsCourtsApi.payload.request;

import com.lifat.CircuitsCourtsApi.model.Producteur;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ProductOrderRequest {

    private Long id;

    private String libelle;

    private String tva;

    private String reference;

    private String origineProduction;

    private String origineTransformation;

    private String agriculture;

    private String typeProduit;

    private String conditionnement;

    private String dluo;

    private Float prix;

    private Float quantite;

    Iterable<Producteur> producteurs;

}
