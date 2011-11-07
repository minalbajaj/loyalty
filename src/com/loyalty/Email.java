package com.loyalty;

public class Email {
	
	int emailId;
	String email;
	String password;
	
	public Email() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Email(int emailId, String email, String password) {
		super();
		this.emailId = emailId;
		this.email = email;
		this.password = password;
	}

	public int getEmailId() {
		return emailId;
	}

	public void setEmailId(int emailId) {
		this.emailId = emailId;
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
		return "Email [emailId=" + emailId + ", email=" + email + ", password="
				+ password + "]";
	}
	
	
	

}
