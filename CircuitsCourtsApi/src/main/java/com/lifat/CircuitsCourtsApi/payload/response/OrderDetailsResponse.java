package com.lifat.CircuitsCourtsApi.payload.response;

import com.lifat.CircuitsCourtsApi.model.Producteur;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
import java.util.Set;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class OrderDetailsResponse {

    private Long id;
    private Long idClient;
    private Date dateCommande;

    private Iterable<OrderProductDetailsResponse> orderProductDetails;

}
