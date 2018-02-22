/* Copyright 2015 Oracle and/or its affiliates. All rights reserved. */
package com.example.employees.repository;

import java.util.ArrayList;
import java.util.List;

import com.example.employees.domain.Employee;


public class EmployeeList {
    private static final List<Employee> employeeList = new ArrayList<Employee>();
    
    private EmployeeList(){
    }
    
    static{
        employeeList.add(new Employee("Herr", "John","Smith","12-12-1980","Manager","Sales","john.smith@abc.com", "078-965-43-56"));
        employeeList.add(new Employee("Frau", "Laura","Adams","02-11-1979","Manager","IT","laura.adams@abc.com", "076-345-73-56"));
        employeeList.add(new Employee("Herr", "Peter","Williams","22-10-1966","Coordinator","HR","peter.williams@abc.com", "079-965-43-56"));
        employeeList.add(new Employee("Frau", "Joana","Sanders","11-11-1976","Manager","Marketing","joana.sanders@abc.com", "079-55-43-56"));
        employeeList.add(new Employee("Herr", "John","Drake","18-08-1988","Coordinator","Finance","john.drake@abc.com", "078-325-47-75"));
        employeeList.add(new Employee("Herr", "Samuel","Williams","22-03-1985","Coordinator","Finance","samuel.williams@abc.com", "078-545-64-21"));
    }
    
    public static List <Employee> getInstance(){
        return employeeList;
    }
}
