package com.lifat.CircuitsCourtsApi.service;

import com.lifat.CircuitsCourtsApi.model.Tournee;
import com.lifat.CircuitsCourtsApi.repository.TourneeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class TourneeService {
    @Autowired
    private TourneeRepository tourneeRepository;

    public Iterable<Tournee> getTournee() {
        return tourneeRepository.findAll();
    }

    public Optional<Tournee> getTourneeById(Long id){
        return tourneeRepository.findById(id);
    }

    public void deletTournee(Tournee tournee){
        tourneeRepository.delete(tournee);
    }

    //=================---------------------------=================

    //TODO : verification de la validité de la tournee
    public boolean isTourneeValid(Tournee tournee){
        return false;
    }
}