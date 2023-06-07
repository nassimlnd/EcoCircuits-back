package com.lifat.CircuitsCourtsApi.payload.request;

import com.lifat.CircuitsCourtsApi.model.Adresse;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CustomerOrderResponse {

    private Long id;

    private String nom;

    private String prenom;

    private String email;

    private String telephone;

    private String adresse;

    private String ville;

    private Integer codePostal;

    private double latitude;

    private double longitude;

    private Iterable<Adresse> adresses;


}
