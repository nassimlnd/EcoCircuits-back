package com.lifat.CircuitsCourtsApi;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;


@SpringBootApplication
@EnableJpaAuditing
public class CircuitsCourtsApiApplication {

	public static void main(String[] args) {
		SpringApplication.run(CircuitsCourtsApiApplication.class, args);
	}
}
