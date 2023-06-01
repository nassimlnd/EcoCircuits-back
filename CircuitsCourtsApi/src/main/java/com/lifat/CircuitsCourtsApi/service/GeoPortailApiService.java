package com.lifat.CircuitsCourtsApi.service;

import com.lifat.CircuitsCourtsApi.model.Client;
import com.lifat.CircuitsCourtsApi.model.Producteur;
import com.lifat.CircuitsCourtsApi.repository.ProducteurRepository;
import net.minidev.json.JSONArray;
import net.minidev.json.JSONObject;
import net.minidev.json.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.text.Normalizer;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Optional;

@Service
public class GeoPortailApiService {

    @Autowired
    private ProducteurRepository producteurRepository;

    /**
     * Verifie que le client se situe dans le rayon de livraison du producteur
     * @param producteur
     * @param client
     * @return true si le client se situe dans le rayon de livraison lance une exception sinon.
     * @exception
     */

    /**
     * Calcule une distance en metre entre 2 points gps
     * @param latitude1
     * @param longitude1
     * @param latitude2
     * @param longitude2
     * @return la distance en m
     */
    public double verifDistanceBetweenProducteurAndClient(double latitude1, double longitude1, double latitude2, double longitude2){
        System.out.println(latitude1 +" "+ latitude2 +" "+ longitude1+" "+longitude2);
        latitude1 = Math.toRadians(latitude1);
        latitude2 = Math.toRadians(latitude2);
        longitude1 = Math.toRadians(longitude1);
        longitude2 = Math.toRadians(longitude2);
        System.out.println(latitude1 +" "+ latitude2 +" "+ longitude1+" "+longitude2);

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
