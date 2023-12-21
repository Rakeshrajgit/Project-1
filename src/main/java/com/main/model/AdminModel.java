package com.main.model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name ="Admin_Reg")
public class AdminModel {
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE)
	int id;
	String name;
	String email;
	String password;
	String utype;
	
	
	public AdminModel(String name, String email, String password, String utype) {
		
		this.name = name;
		this.email = email;
		this.password = password;
		this.utype = utype;
	}
	
	public AdminModel() {}
	
	
	
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
	public String getUtype() {
		return utype;
	}
	public void setUtype(String utype) {
		this.utype = utype;
	}

	@Override
	public String toString() {
		return "AdminModel [id=" + id + ", name=" + name + ", email=" + email + ", password=" + password + ", utype="
				+ utype + "]";
	}
	
	
	
	
	

}
