package com.lifat.CircuitsCourtsApi.service.calculTournee;

import com.lifat.CircuitsCourtsApi.model.*;
import com.lifat.CircuitsCourtsApi.repository.ClientRepository;
import com.lifat.CircuitsCourtsApi.repository.CommandeProducteurRepository;
import com.lifat.CircuitsCourtsApi.repository.CommandeRepository;
import com.lifat.CircuitsCourtsApi.repository.ProducteurRepository;

import com.lifat.CircuitsCourtsApi.service.calculTournee.Data;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.ortools.constraintsolver.Assignment;
import com.google.ortools.constraintsolver.FirstSolutionStrategy;
import com.google.ortools.constraintsolver.RoutingIndexManager;
import com.google.ortools.constraintsolver.RoutingModel;
import com.google.ortools.constraintsolver.RoutingSearchParameters;
import com.google.ortools.constraintsolver.main;

import java.awt.*;
import java.util.*;

@Service
public class GeoPortailApiService {
    /**
     * Calcule une distance en metre entre 2 points gps
     *
     * @param latitude1
     * @param longitude1
     * @param latitude2
     * @param longitude2
     * @return la distance en m
     */
    public double verifDistanceBetweenProducteurAndClient(double latitude1, double longitude1, double latitude2, double longitude2) {
        System.out.println(latitude1 + " " + latitude2 + " " + longitude1 + " " + longitude2);
        latitude1 = Math.toRadians(latitude1);
        latitude2 = Math.toRadians(latitude2);
        longitude1 = Math.toRadians(longitude1);
        longitude2 = Math.toRadians(longitude2);
        System.out.println(latitude1 + " " + latitude2 + " " + longitude1 + " " + longitude2);

        double earthRadius = 6371.07103; // Rayon de la Terre en kilomètres
        double diffLat = latitude2 - latitude1;
        double diffLon = longitude2 - longitude1;
        double a = Math.pow(Math.sin(diffLat / 2), 2)
                + Math.cos(latitude1) * Math.cos(latitude2) * Math.pow(Math.sin(diffLon / 2), 2);
        double c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
        double distance = earthRadius * c;
        System.out.println("distance en km : " + distance);
        return distance;

    }


}



