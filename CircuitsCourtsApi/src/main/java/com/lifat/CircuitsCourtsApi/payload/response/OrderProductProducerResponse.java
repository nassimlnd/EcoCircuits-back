package com.lifat.CircuitsCourtsApi.payload.response;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class OrderProductProducerResponse {

    private Long idProducteur;
    private String description;
    private String tags;
    private String libelle;
    private String adresse;
    private String mail;
    private Float rayonLivraison;

    private Float quantite;


}
