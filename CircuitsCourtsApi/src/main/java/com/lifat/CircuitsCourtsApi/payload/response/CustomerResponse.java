package com.lifat.CircuitsCourtsApi.payload.response;

import com.lifat.CircuitsCourtsApi.model.Adresse;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CustomerResponse {

    private Long id;
    private String nom;
    private String prenom;

    private String adresse;
    private String ville;
    private Integer codePostal;
    private String email;
    private String telephone;

    private double latitude;

    private double longitude;

    private Iterable<Adresse> adresses;

}
