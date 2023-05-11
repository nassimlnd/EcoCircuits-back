package com.lifat.CircuitsCourtsApi.model;

import jakarta.persistence.*;
import lombok.Data;



@Entity
@Data
@Table(name ="Jwt")
public class Jwt {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column
    private String jwt;
}
