package com.lifat.CircuitsCourtsApi.service;

import com.lifat.CircuitsCourtsApi.model.Hub;
import com.lifat.CircuitsCourtsApi.repository.HubRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class HubSrevice {

    @Autowired
    private HubRepository hubRepository;

    public Iterable<Hub> getAllHubs(){
        return hubRepository.findAll();
    }

    public Hub getHubById(Long id){
        return hubRepository.findById(id).get();
    }

    public Hub saveHub(Hub hub){
        Hub savedHub = hubRepository.save(hub);
        return savedHub;
    }

    public void deletHubById(Long id){
        hubRepository.deleteById(id);
    }
}
