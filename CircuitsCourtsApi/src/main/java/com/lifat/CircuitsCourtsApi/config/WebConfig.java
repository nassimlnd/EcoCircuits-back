package com.lifat.CircuitsCourtsApi.config;

import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

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
