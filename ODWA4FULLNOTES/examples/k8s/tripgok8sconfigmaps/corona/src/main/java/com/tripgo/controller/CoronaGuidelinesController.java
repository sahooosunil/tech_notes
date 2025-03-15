package com.tripgo.controller;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class CoronaGuidelinesController {
	@Value("${guidelines.oxygenLevels}")
	private String oxygenLevels;
	@Value("${guidelines.quarantine}")
	private String quarantine;
	@Value("${guidelines.liters}")
	private String liters;
	@Value("${guidelines.temparatureLevels}")
	private String temparatureLevels;
	
	@GetMapping("/guidelines")
	public String showCoronaGuidelines(Model model) {
		
		
		return "guidelines [oxygenLevels: "+oxygenLevels + ", quarantine days: "+ quarantine + ", liters : "+ liters + ", temparatureLevels: " + temparatureLevels + "]";
	}

}
