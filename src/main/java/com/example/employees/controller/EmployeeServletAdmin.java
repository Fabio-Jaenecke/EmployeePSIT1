/* Copyright 2015 Oracle and/or its affiliates. All rights reserved. */
package com.example.employees.controller;

import java.io.IOException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.RequestDispatcher;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.Session;

import com.example.employees.domain.Employee;
import com.example.employees.service.EmployeeService;

@WebServlet(
        name = "EmployeeAdmin",
        urlPatterns = {"/admin/"}
)
public class EmployeeServletAdmin extends HttpServlet {
	
	private static final long serialVersionUID = 4879943638044076696L;
	EmployeeService employeeService = new EmployeeService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	HttpSession session = req.getSession(true);
    	String userId=(String) session.getAttribute("userid");
    	if (userId==null){
    		  String nextJSP = "/jsp/login.jsp";
    	        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(nextJSP);
    	         dispatcher.forward(req, resp);
    	         return;
    	}
    	
        String action = req.getParameter("searchAction");
        if (action!=null){
            switch (action) {           
            case "searchById":
                searchEmployeeById(req, resp);
                break;           
            case "searchByName":
                searchEmployeeByName(req, resp);
                break;
            }
        }else{
            List<Employee> result = employeeService.getAllEmployees();
            forwardListEmployees(req, resp, result);
        }
    }

    protected void searchEmployeeById(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        long idEmployee = Integer.valueOf(req.getParameter("idEmployee"));
        Employee employee = null;
        try {
            employee = employeeService.getEmployee(idEmployee);
        } catch (Exception ex) {
            Logger.getLogger(EmployeeServletMitarbeiter.class.getName()).log(Level.SEVERE, null, ex);
        }
        req.setAttribute("employee", employee);
        req.setAttribute("action", "edit");
    }
    
    @Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String action = req.getParameter("action");
        switch (action) {
            case "add":
                addEmployeeAction(req, resp);
                break;
            case "edit":
                editEmployeeAction(req, resp);
                break;            
            case "remove":
                removeEmployeeByName(req, resp);
                break;            
        }
	}
	
	
	protected void editEmployeeAction(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
    	String anrede = req.getParameter("anrede");
        String name = req.getParameter("name");
        String lastName = req.getParameter("lastName");
        String birthday = req.getParameter("birthDate");
        String role = req.getParameter("role");
        String department = req.getParameter("department");
        String email = req.getParameter("email");
        String telefon = req.getParameter("telefon");
        long idEmployee = Integer.valueOf(req.getParameter("idEmployee"));
        Employee employee = new Employee(anrede, name, lastName, birthday, role, department, email, telefon, idEmployee);
        employee.setId(idEmployee);
        boolean success = employeeService.updateEmployee(employee);
        String message = null;
        if (success) {
            message = "The employee has been successfully updated.";
        }
        List<Employee> employeeList = employeeService.getAllEmployees();
        req.setAttribute("idEmployee", idEmployee);
        req.setAttribute("message", message);
        forwardListEmployees(req, resp, employeeList);
    }  
    
	
    protected void removeEmployeeByName(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        long idEmployee = Integer.valueOf(req.getParameter("idEmployee"));
        boolean confirm = employeeService.deleteEmployee(idEmployee);
        if (confirm){
            String message = "The employee has been successfully removed.";
            req.setAttribute("message", message);
        }
        List<Employee> employeeList = employeeService.getAllEmployees();
        forwardListEmployees(req, resp, employeeList);
    }
	
	protected void searchEmployeeByName(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String employeeName = req.getParameter("employeeName");
        List<Employee> result = employeeService.searchEmployeesByName(employeeName);        
        forwardListEmployees(req, resp, result);
    }

    protected void forwardListEmployees(HttpServletRequest req, HttpServletResponse resp, List<Employee> employeeList)
            throws ServletException, IOException {
        String nextJSP = "/${pageContext.request.contextPath}/../jsp/list-employees_Admin.jsp";
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(nextJSP);
        req.setAttribute("employeeList", employeeList);
        dispatcher.forward(req, resp);
    }   
	
	 
	 protected void addEmployeeAction(HttpServletRequest req, HttpServletResponse resp)
	            throws ServletException, IOException {
	    	String anrede = req.getParameter("anrede");
	        String name = req.getParameter("name");
	        String lastName = req.getParameter("lastName");
	        String birthday = req.getParameter("birthDate");
	        String role = req.getParameter("role");
	        String department = req.getParameter("department");
	        String email = req.getParameter("email");
	        String telefon = req.getParameter("telefon");
	        Employee employee = new Employee(anrede, name, lastName, birthday, role, department, email, telefon);
	        long idEmployee = employeeService.addEmployee(employee);
	        List<Employee> employeeList = employeeService.getAllEmployees();
	        req.setAttribute("idEmployee", idEmployee);
	        String message = "The new employee has been successfully created.";
	        req.setAttribute("message", message);
	        forwardListEmployees(req, resp, employeeList);
	    }
	 
	
	    
    
   

}
