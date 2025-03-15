package com.urotaxi.entities;

import jakarta.persistence.*;

import java.io.Serializable;
import java.util.Objects;

@Entity
@Table(name = "ride")
public class Ride implements Serializable {
    private static final long serialVersionUID = -6624865292028425990L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ride_no")
    protected int rideNo;
    @Column(name = "car_type")
    protected String carType;
    protected String source;
    protected String destination;
    @Column(name = "mobile_no")
    protected String mobileNo;

    public int getRideNo() {
        return rideNo;
    }

    public void setRideNo(int rideNo) {
        this.rideNo = rideNo;
    }

    public String getCarType() {
        return carType;
    }

    public void setCarType(String carType) {
        this.carType = carType;
    }

    public String getSource() {
        return source;
    }

    public void setSource(String source) {
        this.source = source;
    }

    public String getDestination() {
        return destination;
    }

    public void setDestination(String destination) {
        this.destination = destination;
    }

    public String getMobileNo() {
        return mobileNo;
    }

    public void setMobileNo(String mobileNo) {
        this.mobileNo = mobileNo;
    }

    @Override
    public int hashCode() {
        return Objects.hash(carType, destination, mobileNo, rideNo, source);
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (obj == null)
            return false;
        if (getClass() != obj.getClass())
            return false;
        Ride other = (Ride) obj;
        return Objects.equals(carType, other.carType) && Objects.equals(destination, other.destination)
                && Objects.equals(mobileNo, other.mobileNo) && rideNo == other.rideNo
                && Objects.equals(source, other.source);
    }

}
