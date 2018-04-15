package com.electronicbackend.dto;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class Address 
{
	@Id
	@GeneratedValue
	private int addressId;
	private int userId;
	@Override
	public String toString() {
		return "Address [addressId=" + addressId + ", userId=" + userId + ", address1=" + address1 + ", address2="
				+ address2 + ", city=" + city + ", state=" + state + ", zip=" + zip + "]";
	}

	public int getAddressId() {
		return addressId;
	}

	public void setAddressId(int addressId) {
		this.addressId = addressId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getAddress1() {
		return address1;
	}

	public void setAddress1(String address1) {
		this.address1 = address1;
	}

	public String getAddress2() {
		return address2;
	}

	public void setAddress2(String address2) {
		this.address2 = address2;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getZip() {
		return zip;
	}

	public void setZip(String zip) {
		this.zip = zip;
	}

	public Address(int addressId, int userId, String address1, String address2, String city, String state, String zip) {
		super();
		this.addressId = addressId;
		this.userId = userId;
		this.address1 = address1;
		this.address2 = address2;
		this.city = city;
		this.state = state;
		this.zip = zip;
	}

	private String address1;
	private String address2;
	private String city;
	private String state;
	private String zip;
	
	public Address() {
		super();
	}
	
	
}
