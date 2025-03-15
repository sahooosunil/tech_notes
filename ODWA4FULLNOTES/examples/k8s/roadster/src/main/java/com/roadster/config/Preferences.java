package com.roadster.config;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

@Component
@ConfigurationProperties(prefix = "preferences")
public class Preferences {
	private String city;
	private String originCountry;
	private boolean internationalPlaces;
	private String gender;
	private int age;

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getOriginCountry() {
		return originCountry;
	}

	public void setOriginCountry(String originCountry) {
		this.originCountry = originCountry;
	}

	public boolean isInternationalPlaces() {
		return internationalPlaces;
	}

	public void setInternationalPlaces(boolean internationalPlaces) {
		this.internationalPlaces = internationalPlaces;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	@Override
	public String toString() {
		return "Preferences [city=" + city + ", originCountry=" + originCountry + ", internationalPlaces="
				+ internationalPlaces + ", gender=" + gender + ", age=" + age + "]";
	}

}
