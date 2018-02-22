package com.example.employees.service;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.example.employees.domain.Employee;

public class AdminLogin {
	public static String getSetRole(String name, String password, String role) {
		return role;
	}	
    public static boolean  checkLogin(String name, String password, String role){
	    	HashMap<String, String> adminLogins = new HashMap<>();
	    	adminLogins.put("Admin", "123");
	    	for (String login : adminLogins.keySet()) {
	    		if (name.equals(login) && password.equals(adminLogins.get(login))){
	    			if(role.equals("Administrator")) {
	    				return true;
	    			}
	        	}
	    	}
	    	HashMap<String, String> mitarbeiterLogins = new HashMap<>();
	    	mitarbeiterLogins.put("Fabio", "123");
	    	mitarbeiterLogins.put("Peter", "123");
	    	mitarbeiterLogins.put("John", "123");
	    	mitarbeiterLogins.put("Jonas", "123");
	    	for (String login : mitarbeiterLogins.keySet()) {
	    		if (name.equals(login) && password.equals(mitarbeiterLogins.get(login))){
	    			if(role.equals("Mitarbeiter")) {
	    				return true;
	    			}
	        	}
	    	}
	    	return false;
    	}
}
