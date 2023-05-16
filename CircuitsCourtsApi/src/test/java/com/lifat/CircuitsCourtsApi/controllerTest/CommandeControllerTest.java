package com.lifat.CircuitsCourtsApi.controllerTest;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.lifat.CircuitsCourtsApi.controller.CommandeController;
import com.lifat.CircuitsCourtsApi.model.Commande;
import com.lifat.CircuitsCourtsApi.model.CommandeDetail;
import com.lifat.CircuitsCourtsApi.model.CommandeProducteur;
import com.lifat.CircuitsCourtsApi.repository.CommandeDetailRepository;
import com.lifat.CircuitsCourtsApi.repository.CommandeProducteurRepository;
import com.lifat.CircuitsCourtsApi.repository.CommandeRepository;
import com.lifat.CircuitsCourtsApi.service.CommandeDetailService;
import com.lifat.CircuitsCourtsApi.service.CommandeProducteurService;
import com.lifat.CircuitsCourtsApi.service.CommandeService;
import org.mockito.InjectMocks;
import org.mockito.Mockito;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.result.MockMvcResultMatchers;

import java.time.Instant;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import static org.hamcrest.Matchers.hasSize;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@SpringBootTest
@AutoConfigureMockMvc
public class CommandeControllerTest {

    @Autowired
    private MockMvc mockMvc;

    @Autowired
    private CommandeService commandeService;
    @Autowired
    private CommandeDetailService commandeDetailService;

    @Autowired
    private CommandeRepository commandeRepository;
    @Autowired
    private CommandeDetailRepository commandeDetailRepository;

    @Autowired
    private CommandeProducteurRepository commandeProducteurRepository;

    @Autowired
    private CommandeProducteurService commandeProducteurService;


    @InjectMocks
    CommandeController commandeController;

    //pour obtenir le contenu json d'un object.
    @Autowired
    private ObjectMapper objectMapper;

    @Test
    public void testGetCommandeById() throws Exception {
        mockMvc.perform(get("/api/commandes/2"))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.id").value("2"));

    }


    @Test
    public void testGetAllCommandes() throws Exception {
        List<Commande> commandes = (List<Commande>) commandeRepository.findAll();
        mockMvc.perform(get("/api/commandes"))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$", hasSize(commandes.size())));
    }

    @Test
    public void testSaveCommande() throws Exception {
        //creation d'une nouvelle commande pour le test.
        Commande commande = new Commande();
        commande.setId(-1L);
        commande.setIdClient(1L);
        commande.setDateCommande(Date.from(Instant.now()));

        //creation du mock
        commandeRepository = Mockito.mock(CommandeRepository.class);

        //simule l'enregistrement d'une commande dans la base de données.
        Mockito.when(commandeRepository.save(commande)).thenReturn(commande);

        //transforme les data l'objet en format json.
        String obToJson = objectMapper.writeValueAsString(commande);

        //effectue la requette en POST à l'api avec cette commande.
        mockMvc.perform(MockMvcRequestBuilders
                        .post("/api/commandes")
                        .contentType(MediaType.APPLICATION_JSON)
                        .accept(MediaType.APPLICATION_JSON)
                        .content(obToJson))
                .andDo(print())
                //verification si la commande de la base de donnée et celle de la requête sont la même.
                .andExpect(status().isOk())
                .andExpect(MockMvcResultMatchers.jsonPath("$.id").value("-1"))
                .andExpect(MockMvcResultMatchers.jsonPath("$.idClient").value("1"))
                .andExpect(MockMvcResultMatchers.jsonPath("$.dateCommande").value(""));
    }

    @Test
    public void testDeleteCommande() throws Exception {
        Commande c = new Commande();
        c.setIdClient(1L);
        c.setDateCommande(Date.from(Instant.now()));
        //renvoie la commande une fois insérée dans la BD, sert à recuperer par la suite l'id de la commande car généré automatiquement
        c = commandeService.saveCommande(c);
        commandeRepository = Mockito.mock(CommandeRepository.class);

        //simule l'ajout de la commande à la base de données pour fair la requête delete sur cette commande
        Mockito.when(commandeRepository.findById(c.getId())).thenReturn(Optional.of(c));
        mockMvc.perform(MockMvcRequestBuilders
                        .delete("/api/commandes/" + c.getId())
                        .contentType(MediaType.APPLICATION_JSON))
                //le status 204 d'une requête signifie que la ressource à bine été effacée.
                .andExpect(status().is(204));

    }

    @Test
    public void testGetAllCommandeDetails() throws Exception {
        List<CommandeDetail> commandesDetails = (List<CommandeDetail>) commandeDetailRepository.findAll();
        mockMvc.perform(get("/api/commandes/details"))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$", hasSize(commandesDetails.size())));
    }

    @Test
    public void testGetCommandeDetailsByidCommande() throws Exception {
        mockMvc.perform(get("/api/commandes/2"))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.id").value(2));
    }

    @Test
    public void testSaveCommandeDetails() throws Exception {
        CommandeDetail c = new CommandeDetail();
        c.setIdCommande(2L);
        c.setId(1L);
        c.setQuantite(2.0);
        c.setIdProduit(1L);

        commandeDetailRepository = Mockito.mock(CommandeDetailRepository.class);
        Mockito.when(commandeDetailRepository.save(c)).thenReturn(c);
        String obToJson = objectMapper.writeValueAsString(c);

        mockMvc.perform(MockMvcRequestBuilders
                        .post("/api/commandes/details")
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(obToJson)
                        .accept(MediaType.APPLICATION_JSON))
                .andDo(print())
                .andExpect(MockMvcResultMatchers.jsonPath("$.id").value(c.getId()))
                .andExpect(MockMvcResultMatchers.jsonPath("$.idCommande").value(c.getIdCommande()))
                .andExpect(MockMvcResultMatchers.jsonPath("$.idProduit").value(c.getIdProduit()))
                .andExpect(MockMvcResultMatchers.jsonPath("$.quantite").value(c.getQuantite()));
    }

    @Test
    public void testDeletCommandeDetailById() throws Exception {
        CommandeDetail c = new CommandeDetail();
        c.setIdProduit(1L);
        c.setQuantite(3.0);
        c.setIdCommande(3L);

        //renvoie la commande détail une fois insérée dans la BD, sert à recuperer par la suite l'id de la commandeDetail car généré automatiquement
        c = commandeDetailService.saveCommandeDetail(c);
        commandeDetailRepository = Mockito.mock(CommandeDetailRepository.class);
        Mockito.when(commandeDetailRepository.findById(c.getId())).thenReturn(Optional.of(c));
        mockMvc.perform(MockMvcRequestBuilders
                        .delete("/api/commandes/details/" + c.getId())
                        .contentType(MediaType.APPLICATION_JSON))
                .andExpect(status().is(204));
    }

    @Test
    public void testGetAllCommandesProd() throws Exception {
        List<CommandeProducteur> commandesProducteurs = (List<CommandeProducteur>) commandeProducteurRepository.findAll();
        mockMvc.perform(get("/api/commandes/producteurs"))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$", hasSize(commandesProducteurs.size())));
    }

    @Test
    public void testGetCommandeProducteurById() throws Exception {
        mockMvc.perform(get("/api/commandes/producteurs/1"))
                .andExpect(jsonPath("$.id").value(1))
                .andExpect(status().isOk());
    }

    @Test
    public void testSaveCommandeProducteur() throws Exception {
        CommandeProducteur c = new CommandeProducteur();
        c.setIdProducteur(1L);
        c.setIdCommandeDetails(1L);
        c.setQuantite(2.0);

        c = commandeProducteurRepository.save(c);
        commandeProducteurService = Mockito.mock(CommandeProducteurService.class);
        Mockito.when(commandeProducteurService.saveCommandeProducteur(c)).thenReturn(c);
        String obToJson = objectMapper.writeValueAsString(c);
        Long a = c.getId();
        mockMvc.perform(MockMvcRequestBuilders
                        .post("/api/commandes/producteurs")
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(obToJson)
                        .accept(MediaType.APPLICATION_JSON))
                .andExpect(jsonPath("$.id").value(c.getId()))
                .andExpect(jsonPath("$.idCommandeDetails").value(c.getIdCommandeDetails()))
                .andExpect(jsonPath("$.idProducteur").value(c.getIdProducteur()))
                .andExpect(jsonPath("$.quantite").value(c.getQuantite()));


    }

    //TODO
    @Test
    public void testDeleteCommandeProducteurById() throws Exception {
        CommandeProducteur c = new CommandeProducteur();
        c.setIdProducteur(1L);
        c.setIdCommandeDetails(1L);
        c.setQuantite(2.0);

        c = commandeProducteurService.saveCommandeProducteur(c);
        commandeProducteurRepository = Mockito.mock(CommandeProducteurRepository.class);
        Mockito.when(commandeProducteurRepository.findById(c.getId())).thenReturn(Optional.of(c));
        mockMvc.perform(MockMvcRequestBuilders
                .delete("/api/commandes/producteurs/"+ c.getId())
                .contentType(MediaType.APPLICATION_JSON))
                .andExpect(status().is(204));
    }
}
