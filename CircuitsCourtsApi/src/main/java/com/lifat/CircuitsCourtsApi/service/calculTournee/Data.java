package com.lifat.CircuitsCourtsApi.service.calculTournee;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;


@AllArgsConstructor
@NoArgsConstructor
@lombok.Data
public class Data {
    public  double[][] distanceMatrix;
    public  int vehiculeNumber;
    public  int depot;
}
