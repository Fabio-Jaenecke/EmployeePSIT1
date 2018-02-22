/* Copyright 2015 Oracle and/or its affiliates. All rights reserved. */

package com.example.employees.domain;

import java.util.concurrent.atomic.AtomicLong;

/**
 *
 * @author luperalt
 */
public class Employee {

    private long id;
    private String anrede;
    private String name;
    private String lastName;
    private String birthDate;
    private String role;
    private String department;
    private String email;
    private String telefon;
    private static final AtomicLong counter = new AtomicLong(100);

	public Employee(){};

    public Employee(String anrede, String name, String lastName, String birthDate, String role, String department, String email, String telefon, long id) {
        this.anrede = anrede;
    	this.name = name;
        this.lastName = lastName;
        this.birthDate = birthDate;
        this.role = role;
        this.department = department;
        this.email = email;  
        this.telefon = telefon;
        this.id = id;
    }
    
    public Employee(String anrede, String name, String lastName, String birthDate, String role, String department, String email, String telefon) {
    	this.anrede = anrede;
    	this.name = name;
        this.lastName = lastName;
        this.birthDate = birthDate;
        this.role = role;
        this.department = department;
        this.email = email;   
        this.telefon = telefon;
        this.id = counter.incrementAndGet();
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }
    
    public String getAnrede() {
        return anrede;
    }

    public void setAnrede(String anrede) {
        this.anrede = anrede;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getBirthDate() {
        return birthDate;
    }

    public void setBirthDate(String birthDate) {
        this.birthDate = birthDate;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    
    public String getTelefon() {
        return telefon;
    }

    public void setTelefon(String telefon) {
        this.telefon = telefon;
    }

    @Override
    public String toString() {
        return "Employee{" + "id=" + id + ", name=" + name + ", anrede=" + anrede +
                ", lastName=" + lastName + ", birthDate=" + birthDate + 
                ", role=" + role + ", department=" + department + 
                ", email=" + email + 
                ", telefon=" + telefon + '}';
    }

    
}
