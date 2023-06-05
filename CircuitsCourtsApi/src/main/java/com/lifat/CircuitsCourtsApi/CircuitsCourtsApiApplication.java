package com.lifat.CircuitsCourtsApi;

import com.lifat.CircuitsCourtsApi.repository.ProducteurRepository;
import com.lifat.CircuitsCourtsApi.service.TourneeService;
import com.lifat.CircuitsCourtsApi.service.calculTournee.GeoPortailApiService;
import com.lifat.CircuitsCourtsApi.service.calculTournee.VrpGlobalSpan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;


@SpringBootApplication
@EnableJpaAuditing
public class CircuitsCourtsApiApplication implements CommandLineRunner {
	/**
	 *

	@Autowired
	private GeoPortailApiService geoPortailApiService;
	@Autowired
	private ProducteurRepository producteurRepository;
	*/

	public static void main(String[] args) {
		SpringApplication.run(CircuitsCourtsApiApplication.class, args);
	}

	@Autowired TourneeService tourneeService;

	@Override
	public void run(String... args) {
		try {
			//geoPortailApiService.scriptGetCoodGpsForAll(producteurRepository.findById(6L));
			//tourneeService.testVrp(14L);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
}
