package com.main.model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class CSupport {
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE)
	private long id;
	private String cid;
	private String name;
	private String email;
	private String password;
	
	
	public CSupport() {
		super();
		// TODO Auto-generated constructor stub
	}


	public CSupport(long id, String cid, String name, String email, String password) {
		super();
		this.id = id;
		this.cid = cid;
		this.name = name;
		this.email = email;
		this.password = password;
	}
	
	
	public CSupport( String cid, String name, String email, String password) {
		super();
		
		this.cid = cid;
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


	public String getCid() {
		return cid;
	}


	public void setCid(String cid) {
		this.cid = cid;
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
		return "CSupport [id=" + id + ", cid=" + cid + ", name=" + name + ", email=" + email + ", password=" + password
				+ "]";
	}


	
	
	

	

}
