package com.roadster.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.roadster.config.Preferences;

@Controller
public class PreferencesController {
	@Autowired
	private Preferences preferences;

	@GetMapping(value="/preferences")
	public String showPreferences(ModelMap model) {
		model.addAttribute("preferences", preferences);
		return "preferences";
	}
}
