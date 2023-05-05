package com.lifat.CircuitsCourtsApi.repositoryTest;

import com.lifat.CircuitsCourtsApi.repository.CommandeRepository;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;

class CommandeRepositoryTest {
    @Autowired
    private CommandeRepository commandeRepository;
    @BeforeEach
    void setUp() {
    }

    @AfterEach
    void tearDown() {
    }

    @Test
    void testFindByIdClient() {
    }
}