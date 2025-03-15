package com.healthcare.covido.controller;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.healthcare.covido.entities.ContactUs;
import com.healthcare.covido.form.ContactUsForm;
import com.healthcare.covido.repositories.ContactUsRepository;

@Controller
@RequestMapping("/contactus")
public class ContactUsController {
	@Autowired
	private ContactUsRepository ContactUsRepository;

	@GetMapping
	public String showContactUs() {
		return "contact";
	}

	@PostMapping
	public String saveContactUs(@ModelAttribute("contactUsForm") ContactUsForm contactUsForm, Model model) {
		ContactUs contactUs = null;

		contactUs = new ContactUs();
		BeanUtils.copyProperties(contactUsForm, contactUs);
		contactUs = ContactUsRepository.save(contactUs);
		model.addAttribute("contactUsNo", contactUs.getContactNo());
		model.addAttribute("action", "success");

		return "contact";
	}
}
