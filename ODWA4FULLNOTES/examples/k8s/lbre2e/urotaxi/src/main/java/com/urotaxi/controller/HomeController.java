package com.urotaxi.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.urotaxi.form.ContactUsForm;
import com.urotaxi.form.RideForm;
import com.urotaxi.service.ContactUsService;
import com.urotaxi.service.RideService;

@Controller
public class HomeController {
	@Autowired
	private RideService rideService;
	@Autowired
	private ContactUsService contactUsService;

	@PostMapping("/bookRide")
	public String bookRide(@ModelAttribute("rideForm") RideForm rideForm, Model model) {
		int rideNo = 0;
		rideNo = rideService.bookRide(rideForm);

		model.addAttribute("rideNo", rideNo);
		return "ride-details";
	}

	@PostMapping("/contactUs")
	public String enquire(@ModelAttribute("contactUsForm") ContactUsForm contactUsForm, Model model) {
		int contactUsNo = 0;

		contactUsNo = contactUsService.saveContactUs(contactUsForm);
		model.addAttribute("contactUsNo", contactUsNo);
		return "enquiry-details";
	}
}
