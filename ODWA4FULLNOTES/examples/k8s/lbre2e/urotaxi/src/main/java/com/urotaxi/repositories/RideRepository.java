package com.urotaxi.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.urotaxi.entities.Ride;

public interface RideRepository extends JpaRepository<Ride, Integer> {

}
