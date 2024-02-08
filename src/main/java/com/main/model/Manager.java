package com.main.model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class Manager {
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE)
	private long id;
	private String mid;
	private String name;
	private String email;
	private String password;
	
	
	
	
	public Manager() {
		
	}




	public Manager(int id, String mid, String name, String email, String password) {
		super();
		this.id = id;
		this.mid = mid;
		this.name = name;
		this.email = email;
		this.password = password;
	}
	
	
	public Manager( String mid, String name, String email, String password) {
		super();
		
		this.mid = mid;
		this.name = name;
		this.email = email;
		this.password = password;
	}




	public long getId() {
		return id;
	}




	public void setId(long id) {
		this.id = id;
	}




	public String getMid() {
		return mid;
	}




	public void setMid(String mid) {
		this.mid = mid;
	}




	public String getName() {
		return name;
	}




	public void setName(String name) {
		this.name = name;
	}




	public String getEmail() {
		return email;
	}




	public void setEmail(String email) {
		this.email = email;
	}




	public String getPassword() {
		return password;
	}




	public void setPassword(String password) {
		this.password = password;
	}




	@Override
	public String toString() {
		return "Manager [id=" + id + ", mid=" + mid + ", name=" + name + ", email=" + email + ", password=" + password
				+ "]";
	}
	

	

}
