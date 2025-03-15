package com.urotaxi.form;

import java.io.Serializable;

public class RideForm implements Serializable {
	private static final long serialVersionUID = 365995875180187399L;
	protected int rideNo;
	protected String carType;
	protected String source;
	protected String destination;
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

}
