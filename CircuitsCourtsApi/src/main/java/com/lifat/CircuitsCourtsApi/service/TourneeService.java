package com.lifat.CircuitsCourtsApi.service;

import com.lifat.CircuitsCourtsApi.model.CommandeProducteur;
import com.lifat.CircuitsCourtsApi.model.Producteur;
import com.lifat.CircuitsCourtsApi.model.Tournee;
import com.lifat.CircuitsCourtsApi.repository.CommandeProducteurRepository;
import com.lifat.CircuitsCourtsApi.repository.TourneeRepository;
import com.lifat.CircuitsCourtsApi.service.calculTournee.VrpGlobalSpan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
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

    public Tournee save(Tournee tournee) {
        return tourneeRepository.save(tournee);
    }

    //=================---------------------------=================

    //TODO : verification de la validité de la tournee
    public boolean isTourneeValid(Tournee tournee)throws Exception{
        return false;
    }


    //============--------------===============

   @Autowired
   private VrpGlobalSpan vrpGlobalSpan;

    @Autowired
    private CommandeProducteurRepository commandeProducteurRepository;
    public void testVrp(Long idProducteur){
        vrpGlobalSpan.produceOptimalTourneeTraject((ArrayList<CommandeProducteur>) commandeProducteurRepository.findAllByIdProducteur(idProducteur));
    }

}
