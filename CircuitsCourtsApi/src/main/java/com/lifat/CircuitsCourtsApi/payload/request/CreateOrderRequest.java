package com.lifat.CircuitsCourtsApi.payload.request;

import com.lifat.CircuitsCourtsApi.model.Adresse;
import lombok.Data;

@Data
public class CreateOrderRequest {

    private CustomerOrderResponse customer;

    private Iterable<ProductOrderRequest> products;

    private Adresse adresse;

}
