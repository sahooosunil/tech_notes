package com.foodies.controller;

import java.security.SecureRandom;
import java.util.Arrays;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.foodies.ReservationDto;
import com.foodies.form.ReservationForm;

@Controller
public class ReservationController {

	@GetMapping("/reservation")
	public String showReservationForm() {
		return "reservation";
	}

	@PostMapping("/reservation")
	public String doReservation(@ModelAttribute("reservationForm") ReservationForm form, ModelMap model) {
		model.addAttribute("person", form.getName());
		return "reservation-success";
	}

	@GetMapping("/list")
	public String showReservations(ModelMap model) {
		List<ReservationDto> reservationDtos = Arrays
				.asList(new ReservationDto[] { new ReservationDto("Johnson", "98387393", new SecureRandom().nextInt()),
						new ReservationDto("Joseph", "98387392", new SecureRandom().nextInt()),
						new ReservationDto("James", "9832928", new SecureRandom().nextInt()),
						new ReservationDto("Jack", "72739445", new SecureRandom().nextInt()) });
		model.addAttribute("reservations", reservationDtos);
		return "reservation-list";
	}

}
