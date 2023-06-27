package com.lifat.CircuitsCourtsApi.service.calculTournee;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

/**
 * Crée l'objet data qui est composé d'une matrice de distance entre tous les clients de la tournée,
 * du nombre de véhicule.
 * du nombre de dépot
 */
@AllArgsConstructor
@NoArgsConstructor
@lombok.Data
public class Data {
    public  double[][] distanceMatrix;
    public  int vehiculeNumber;
    public  int depot;
}
