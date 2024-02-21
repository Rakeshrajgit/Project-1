package com.main.model;

import java.time.LocalDate;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "Application")
public class Application {
	
	@Id
	String email;
	String application_no;
	LocalDate date;
	String firstName;
	String lastName;
	String male;
	LocalDate dob;
	String contact_no;
	String address;
	String pan;
	String aadhar_no;
	String driving_license;
	String voter_id;
	String amount;
	String payment;
	String committed_days;
	String executive_name;
	
	
	public Application()
	{
		
	}


	public Application(String email, String application_no, LocalDate date, String firstName, String lastName,
			String male, LocalDate dob, String contact_no, String address, String pan, String aadhar_no,
			String driving_license, String voter_id, String amount, String payment, String committed_days,
			String executive_name) {
		super();
		this.email = email;
		this.application_no = application_no;
		this.date = date;
		this.firstName = firstName;
		this.lastName = lastName;
		this.male = male;
		this.dob = dob;
		this.contact_no = contact_no;
		this.address = address;
		this.pan = pan;
		this.aadhar_no = aadhar_no;
		this.driving_license = driving_license;
		this.voter_id = voter_id;
		this.amount = amount;
		this.payment = payment;
		this.committed_days = committed_days;
		this.executive_name = executive_name;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getApplication_no() {
		return application_no;
	}


	public void setApplication_no(String application_no) {
		this.application_no = application_no;
	}


	public LocalDate getDate() {
		return date;
	}


	public void setDate(LocalDate date) {
		this.date = date;
	}


	public String getFirstName() {
		return firstName;
	}


	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}


	public String getLastName() {
		return lastName;
	}


	public void setLastName(String lastName) {
		this.lastName = lastName;
	}


	public String getMale() {
		return male;
	}


	public void setMale(String male) {
		this.male = male;
	}


	public LocalDate getDob() {
		return dob;
	}


	public void setDob(LocalDate dob) {
		this.dob = dob;
	}


	public String getContact_no() {
		return contact_no;
	}


	public void setContact_no(String contact_no) {
		this.contact_no = contact_no;
	}


	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
	}


	public String getPan() {
		return pan;
	}


	public void setPan(String pan) {
		this.pan = pan;
	}


	public String getAadhar_no() {
		return aadhar_no;
	}


	public void setAadhar_no(String aadhar_no) {
		this.aadhar_no = aadhar_no;
	}


	public String getDriving_license() {
		return driving_license;
	}


	public void setDriving_license(String driving_license) {
		this.driving_license = driving_license;
	}


	public String getVoter_id() {
		return voter_id;
	}


	public void setVoter_id(String voter_id) {
		this.voter_id = voter_id;
	}


	public String getAmount() {
		return amount;
	}


	public void setAmount(String amount) {
		this.amount = amount;
	}


	public String getPayment() {
		return payment;
	}


	public void setPayment(String payment) {
		this.payment = payment;
	}


	public String getCommitted_days() {
		return committed_days;
	}


	public void setCommitted_days(String committed_days) {
		this.committed_days = committed_days;
	}


	public String getExecutive_name() {
		return executive_name;
	}


	public void setExecutive_name(String executive_name) {
		this.executive_name = executive_name;
	}


	@Override
	public String toString() {
		return "Application [email=" + email + ", application_no=" + application_no + ", date=" + date + ", firstName="
				+ firstName + ", lastName=" + lastName + ", male=" + male + ", dob=" + dob + ", contact_no="
				+ contact_no + ", address=" + address + ", pan=" + pan + ", aadhar_no=" + aadhar_no
				+ ", driving_license=" + driving_license + ", voter_id=" + voter_id + ", amount=" + amount
				+ ", payment=" + payment + ", committed_days=" + committed_days + ", executive_name=" + executive_name
				+ "]";
	}
	
	
	


}
