package com.urotaxi.service;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.urotaxi.entities.ContactUs;
import com.urotaxi.form.ContactUsForm;
import com.urotaxi.repositories.ContactUsRepository;

@Service
public class ContactUsService {
	@Autowired
	private ContactUsRepository contactUsRepository;

	public int saveContactUs(ContactUsForm contactUsDto) {
		ContactUs contactUs = null;

		contactUs = new ContactUs();
		BeanUtils.copyProperties(contactUsDto, contactUs);
		contactUs = contactUsRepository.save(contactUs);
		return contactUs.getSno();
	}
}
