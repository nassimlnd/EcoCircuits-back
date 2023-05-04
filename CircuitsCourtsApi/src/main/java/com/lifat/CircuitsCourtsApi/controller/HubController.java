package com.lifat.CircuitsCourtsApi.controller;

import com.lifat.CircuitsCourtsApi.model.Hub;
import com.lifat.CircuitsCourtsApi.service.HubSrevice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@RequestMapping("/api")
@RestController
public class HubController {

    @Autowired
    private HubSrevice hubSrevice;

    @GetMapping("/hubs")
    public Iterable<Hub> getAllHubs(){
        return hubSrevice.getAllHubs();
    }

    @GetMapping("/hubs/{id}")
    public Hub getHubById(@PathVariable Long id){
        return hubSrevice.getHubById(id);
    }

    @PostMapping("/hubs")
    public Hub saveHub(@PathVariable Hub hub){
        return hubSrevice.saveHub(hub);
    }

    @DeleteMapping("/hub/{id}")
    public void deletHubById(@PathVariable Long id){
        hubSrevice.deletHubById(id);
    }
}
