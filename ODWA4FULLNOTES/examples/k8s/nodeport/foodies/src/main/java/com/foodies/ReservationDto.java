package com.foodies;

public class ReservationDto {
	private String person;
	private String phoneNumber;
	private int persons;

	public ReservationDto(String person, String phoneNumber, int persons) {
		super();
		this.person = person;
		this.phoneNumber = phoneNumber;
		this.persons = persons;
	}

	public String getPerson() {
		return person;
	}

	public void setPerson(String person) {
		this.person = person;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public int getPersons() {
		return persons;
	}

	public void setPersons(int persons) {
		this.persons = persons;
	}

}
