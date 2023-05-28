package com.lifat.CircuitsCourtsApi.payload.response;

import com.lifat.CircuitsCourtsApi.model.Producteur;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Set;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class OrderProductDetailsResponse {

    private Long idProduit;
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

    private float quantite;

    private Iterable<OrderProductProducerResponse> orderProductProducers;

}
