package com.tripgo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@SpringBootApplication
public class TripgoApplication implements WebMvcConfigurer {

	public static void main(String[] args) {
		SpringApplication.run(TripgoApplication.class, args);
	}


}
