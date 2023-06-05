package com.lifat.CircuitsCourtsApi.service.calculTournee;

import com.google.ortools.Loader;
import com.google.ortools.constraintsolver.*;
import com.lifat.CircuitsCourtsApi.model.*;
import com.lifat.CircuitsCourtsApi.repository.*;
import lombok.NoArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import java.awt.*;
import java.awt.geom.Point2D;
import java.util.ArrayList;
import java.util.Optional;
import java.util.Queue;
import java.util.logging.Logger;

@NoArgsConstructor
@Service
public class VrpGlobalSpan {
    private static final Logger logger = Logger.getLogger(VrpGlobalSpan.class.getName());
    /**
     * Utilisation de google OR-Tools pour calculer la tournée optimale pour un producteur
     * @param commandesProducteurs une liste de commandes prod d'un producteur qu'il doit livrer
     * @return une Queue de commandesProd, le premier element de la queue est la premiere étape de la tournée
     */

    public Queue<Commande> produceOptimalTourneeTraject(ArrayList<CommandeProducteur> commandesProducteurs) {
        // créer les données pour résoudre le problème
        // la matrice de distance doit contenir la distance netre tous les points de la tournee.
        //-------- initailisation des données ---------
        final Data data = new Data();
        data.vehiculeNumber= 1;
        data.depot = 0;
        data.distanceMatrix = initializeDistanceMatrix(commandesProducteurs);
        afficheMatrice(data.distanceMatrix);


        Loader.loadNativeLibraries();

        RoutingIndexManager manager = new RoutingIndexManager(data.distanceMatrix.length, data.vehiculeNumber, data.depot);
        RoutingModel routing = new RoutingModel(manager);

        //create and register a transit callback
        final int transitCallBackIndex =
                routing.registerTransitCallback((long fromIndex, long toIndex) -> {
                    //convert from routing variable Index to user NodeIndex
                    int fromNode = manager.indexToNode(fromIndex);
                    int toNode = manager.indexToNode(toIndex);
                    return (long) data.distanceMatrix[fromNode][toNode];

                });
        //define cost of each arc.
        routing.setArcCostEvaluatorOfAllVehicles(transitCallBackIndex);

        //add distance constraint, commence le cumul de distance a 0.
        routing.addDimension(transitCallBackIndex, 0, 3000, true, "Distance");

        //Setting first solutions heuristic.
        RoutingSearchParameters searchParameters =
                main.defaultRoutingSearchParameters()
                        .toBuilder()
                        .setFirstSolutionStrategy(FirstSolutionStrategy.Value.PATH_CHEAPEST_ARC)
                        .build();
        //Solve the probleme
        Assignment solution = routing.solveWithParameters(searchParameters);

        printSolution(data, routing, manager, solution);

        // mettre la sollution dans la queue


        return null;
    }

    private void afficheMatrice(double[][] distanceMatrix) {
        for (int i = 0; i < distanceMatrix.length ; i++) {
            for (int j = 0; j < distanceMatrix.length ; j++) {
                System.out.print(distanceMatrix[i][j] + " | ");
            }
            System.out.println();
        }
    }

    public void printSolution( Data data, RoutingModel routingModel, RoutingIndexManager routingIndexManager, Assignment solution){
        //solution cost
        logger.info("Objective : " + solution.objectiveValue());
        //Inspect Solution
        long maxRouteDistance = 0;
        for (int i = 0; i < data.vehiculeNumber; ++i) {
            long index = routingModel.start(i);
            logger.info("Route for Vehicle " + i + ":");
            long routeDistance = 0;
            String route = "";
            while (!routingModel.isEnd(index)) {
                route += routingIndexManager.indexToNode(index) + " -> ";
                long previousIndex = index;
                index = solution.value(routingModel.nextVar(index));
                routeDistance += routingModel.getArcCostForVehicle(previousIndex, index, i);
            }
            logger.info(route + routingIndexManager.indexToNode(index));
            logger.info("Distance of the route: " + routeDistance + "km");
            maxRouteDistance = Math.max(routeDistance, maxRouteDistance);
        }
        logger.info("Maximum of the route distances: " + maxRouteDistance + "km");
    }


    @Autowired
    private CommandeDetailRepository commandeDetailRepository;

    @Autowired
    private ClientRepository clientRepository;

    @Autowired
    private CommandeRepository commandeRepository;

    @Autowired
    private ProducteurRepository producteurRepository;

    @Autowired
    private GeoPortailApiService geoPortailApiService;

    /**
     * initailise la matrice de distance via une liste de commandeProducteur
     * Pour chaque commande prod calcule la distance entre le producteur et le client, et entre le client et tous les autres cilents
     *
     * @param commandesProducteurs
     * @return une matrice de distances exploitable par la bibilotheque google OR-tools (matrice carrée) chaque element de la matrice[i][j] représente la distance en km entre le point i et j
     */
    private double[][] initializeDistanceMatrix(ArrayList<CommandeProducteur> commandesProducteurs) {
        int matrixSize = commandesProducteurs.size();
        //recupere la commandeDetail chaque CommandeProducteur
        //une ArrayList<Point> pour recuperer toutes les points possibles de la tournee !! le producteur DOIT être le permier de la list.
        //on crée un point à partir des coordonées gps du producteur et on le met en 1er dans la liste.
        ArrayList<Point2D.Double> points = new ArrayList<>();
        System.out.println(commandesProducteurs);
        Long idProd = commandesProducteurs.get(0).getIdProducteur();
        System.out.println(" ID PRODUCTEUR : " + idProd);
        Optional<Producteur> producteur = producteurRepository.findById(idProd);
        System.out.println(" PRODUCTEUR : "+ producteur);
        Point2D.Double pointProd = new Point2D.Double();
        pointProd.setLocation(producteur.get().getLatitude(), producteur.get().getLongitude());
        points.add(pointProd);
        System.out.println(pointProd);
        //on recupere le client pour toutes les commandes prod en passant par la commandeProd --> commandeDetail --> commande --> client.
        // puis on crée un point composé des coordonées gps du client.
        for (CommandeProducteur cp : commandesProducteurs) {
            System.out.println(cp.toString());
            CommandeDetail cd = commandeDetailRepository.findOneCommandeDetailByCommandeProd(cp.getIdCommandeDetails());
            //System.out.println(cd.toString());
            //pas besoin de faire verification produceur.isEmpty() car ce sont des prod d'une commande deja verifiée.
            Optional<Producteur> temp = producteurRepository.findById(cp.getIdProducteur());
            Optional<Commande> commande = commandeRepository.findById(cd.getIdCommande());
            Optional<Client> client = clientRepository.findById(commande.get().getIdClient());
            System.out.println(client);
            Point2D.Double p = new Point2D.Double();
            p.setLocation(client.get().getLatitude(), client.get().getLongitude());
            points.add(p);
        }

        // sachant que le 1er element de l'arrayList est Point représentant les coordonées gps du producteur
        double[][] result = new double[matrixSize][matrixSize];
        for (int i = 0; i < matrixSize; i++) {

            for (int j = 0; j < matrixSize; j++) {
                //le cas ou on calcule la distance du depot au depot
                // metre 0 manuelement pour signifier que la distance est nulle
               if (i == j) {
                    result[i][j] = 0;
                }
                //calcule distance entre 2 points
                //latitude 1, longitude 1, latitude 2, longitude 2
                result[i][j] = geoPortailApiService.verifDistanceBetweenProducteurAndClient(points.get(i).getX(), points.get(i).getY(), points.get(j).getX(), points.get(j).getY());
            }
        }
        return result;
    }
}
