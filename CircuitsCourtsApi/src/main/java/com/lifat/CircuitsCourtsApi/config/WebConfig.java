package com.lifat.CircuitsCourtsApi.config;

import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

/**
 * Cette classe de configuration permet de gérer la configuration des requêtes CORS (Cross-Origin Resource Sharing) pour votre API.
 * CORS Limite les requêtes provenant d'un domaine différent de celui du serveur d'API
 * Précise le types de requêtes http que l'api supporte
 */
public class WebConfig extends WebMvcConfigurerAdapter {

    @Override
    public void addCorsMappings(CorsRegistry registry) {
        registry.addMapping("/api/**")
                .allowedOrigins("*")
                .allowedMethods("PUT", "DELETE", "POST", "GET", "OPTIONS")
                .allowedHeaders("Content-Type", "Authorization", "Content-Length", "X-Requested-With")
                .exposedHeaders("Content-Type", "Authorization", "Content-Length", "X-Requested-With")
                .allowCredentials(false).maxAge(3600);
    }

}
