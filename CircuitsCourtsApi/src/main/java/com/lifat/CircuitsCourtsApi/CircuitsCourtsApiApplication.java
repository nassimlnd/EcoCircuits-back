package com.lifat.CircuitsCourtsApi;

import com.lifat.CircuitsCourtsApi.JWTEndPointsProtection.JwtUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;



@SpringBootApplication
public class CircuitsCourtsApiApplication {

	public static void main(String[] args) {
		SpringApplication.run(CircuitsCourtsApiApplication.class, args);
	}
}
