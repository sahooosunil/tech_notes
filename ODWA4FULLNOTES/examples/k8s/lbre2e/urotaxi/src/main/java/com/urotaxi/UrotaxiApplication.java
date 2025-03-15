package com.urotaxi;

import java.time.Duration;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.http.CacheControl;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@SpringBootApplication
public class UrotaxiApplication extends SpringBootServletInitializer implements WebMvcConfigurer {

	public static void main(String[] args) {
		SpringApplication.run(UrotaxiApplication.class, args);
	}

	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
		return builder.sources(UrotaxiApplication.class);
	}

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		CacheControl cc = CacheControl.maxAge(Duration.ofMinutes(30)).cachePublic().sMaxAge(Duration.ofHours(1));
		registry.addResourceHandler("/static/**").setCacheControl(cc);
	}

	@Override
	public void addViewControllers(ViewControllerRegistry registry) {
		registry.addViewController("/index.html").setViewName("index");
		registry.addViewController("/contact.html").setViewName("contact");
		registry.addViewController("/service.html").setViewName("service");
		registry.addViewController("/news.html").setViewName("news");
		registry.addViewController("/about.html").setViewName("about");
	}

}
