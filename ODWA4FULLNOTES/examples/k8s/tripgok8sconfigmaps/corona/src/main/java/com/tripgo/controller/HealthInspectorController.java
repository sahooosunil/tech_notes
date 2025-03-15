package com.tripgo.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Properties;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HealthInspectorController {
	@Value("${config.location}")
	private String configLocation;

	@GetMapping(value = "/{district}/inspector", produces = { "application/json" })
	public String getHealthInspectors(@PathVariable("district") String district)
			throws FileNotFoundException, IOException {
		Properties props = new Properties();
		props.load(new FileInputStream(new File(configLocation + "district-healthinspectors.properties")));

		String inspectorName = props.getProperty(district);
		String response = "{district:\"" + district + "\", inspector:\"" + inspectorName + "\"}";
		return response;
	}
}