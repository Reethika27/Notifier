package com.bean;
public class LoginBean {
	
	 private String email;
	 private String password;
	 public String getPassword() {
	 return password;
	 }
	 public void setPassword(String password) {
	 this.password = password;
	 }
	 public void setEmail(String email) {
	 this.email = email;
	 }
	 public String getEmail() {
		 System.out.println("Success bean");
	 return email;
	 }
	}