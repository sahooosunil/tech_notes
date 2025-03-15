package com.urotaxi.service;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.urotaxi.entities.Ride;
import com.urotaxi.form.RideForm;
import com.urotaxi.repositories.RideRepository;

@Service
public class RideService {
	@Autowired
	private RideRepository rideRepository;

	public int bookRide(RideForm rideDto) {
		Ride ride = null;

		ride = new Ride();
		BeanUtils.copyProperties(rideDto, ride);
		ride = rideRepository.save(ride);
		return ride.getRideNo();
	}

}
