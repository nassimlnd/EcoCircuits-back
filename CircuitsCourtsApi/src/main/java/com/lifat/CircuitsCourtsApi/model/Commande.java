package com.lifat.CircuitsCourtsApi.model;

import javax.persistence.*;
import lombok.Data;

@Data
@Entity
@Table(name = "commandes")
public class Commande {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "id_client")
    private Long idClient;

    @Column(name = "date_commande")
    private String dateCommande;
}
