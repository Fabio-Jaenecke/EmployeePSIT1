<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login</title>
<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
      <link rel="icon" href="/favicon.ico" type="image/x-icon">
      <link rel="apple-touch-icon" sizes="57x57" href="http://localhost:8080/psit12-jsp-employee-2017/apple-icon-57x57.png">
      <link rel="apple-touch-icon" sizes="60x60" href="http://localhost:8080/psit12-jsp-employee-2017/apple-icon-60x60.png">
      <link rel="apple-touch-icon" sizes="72x72" href="http://localhost:8080/psit12-jsp-employee-2017/apple-icon-72x72.png">
      <link rel="apple-touch-icon" sizes="76x76" href="http://localhost:8080/psit12-jsp-employee-2017/apple-icon-76x76.png">
      <link rel="apple-touch-icon" sizes="114x114" href="http://localhost:8080/psit12-jsp-employee-2017/apple-icon-114x114.png">
      <link rel="apple-touch-icon" sizes="120x120" href="http://localhost:8080/psit12-jsp-employee-2017/apple-icon-120x120.png">
      <link rel="apple-touch-icon" sizes="144x144" href="http://localhost:8080/psit12-jsp-employee-2017/apple-icon-144x144.png">
      <link rel="apple-touch-icon" sizes="152x152" href="http://localhost:8080/psit12-jsp-employee-2017/apple-icon-152x152.png">
      <link rel="apple-touch-icon" sizes="180x180" href="http://localhost:8080/psit12-jsp-employee-2017/apple-icon-180x180.png">
      <link rel="icon" type="image/png" sizes="192x192"  href="http://localhost:8080/psit12-jsp-employee-2017/android-icon-192x192.png">
      <link rel="icon" type="image/png" sizes="32x32" href="http://localhost:8080/psit12-jsp-employee-2017/favicon-32x32.png">
      <link rel="icon" type="image/png" sizes="96x96" href="http://localhost:8080/psit12-jsp-employee-2017/favicon-96x96.png">
      <link rel="icon" type="image/png" sizes="16x16" href="http://localhost:8080/psit12-jsp-employee-2017/favicon-16x16.png">
      <link rel="shortcut icon" type="image/png" sizes="32x32" href="http://localhost:8080/psit12-jsp-employee-2017/favicon-32x32.png">
      <link rel="shortcut icon" type="image/png" sizes="96x96" href="http://localhost:8080/psit12-jsp-employee-2017/favicon-96x96.png">
      <link rel="shortcut icon" type="image/png" sizes="16x16" href="http://localhost:8080/psit12-jsp-employee-2017/favicon-16x16.png">
      <link rel="manifest" href="http://localhost:8080/psit12-jsp-employee-2017/manifest.json">
      <meta name="msapplication-TileColor" content="#ffffff">
      <meta name="msapplication-TileImage" content="http://localhost:8080/psit12-jsp-employee-2017/ms-icon-144x144.png">
      <meta name="theme-color" content="#ffffff">
</head>
<body>
<%
if (request.getParameter("uname") == null) {
	// it's not there
%>
<form method="post" action="${pageContext.request.contextPath}/jsp/login.jsp">
    <center>
    <table border="1" width="30%" cellpadding="3">
        <thead>
            <tr>
                <th colspan="2">Login Here</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>User Name</td>
                <td><input type="text" name="uname" value="" /></td>
            </tr>
            <tr>
                <td>Password</td>
                <td><input type="password" name="pass" value="" /></td>
            </tr>
            <tr>
                <td><input type="submit" value="Login" /></td>
                <td><input type="reset" value="Reset" /></td>
            </tr>           
        </tbody>
    </table>
    </center>
</form>
<%@ page import ="com.example.employees.service.*" %>
<%
}else{
    String userid = request.getParameter("uname");    
    String pwd = request.getParameter("pass");
    String role = request.getParameter("logAs");
    String newrole = AdminLogin.getSetRole(userid, pwd, role);
    
    if (AdminLogin.checkLogin(userid, pwd, "Mitarbeiter")) {
        session.setAttribute("userid", userid);
        //out.println("welcome " + userid);
        //out.println("<a href='logout.jsp'>Log out</a>");
        //pageContext.forward("/employee/");
        response.sendRedirect(request.getContextPath() + "/employee/");
        
    }   
    if (AdminLogin.checkLogin(userid, pwd, "Administrator")) {
         session.setAttribute("userid", userid);
         //out.println("welcome " + userid);
         //out.println("<a href='logout.jsp'>Log out</a>");
         //pageContext.forward("/employee/");
         response.sendRedirect(request.getContextPath() + "/admin/");
    } else {
        out.println("Invalid user or password or wrong login role"); 
        out.println();
        out.println("User: " + userid);
        out.println("Password: " +pwd);
        out.println("<form action ='${pageContext.request.contextPath}/../login.jsp'><br><button type='submit' class='btn btn-primary  btn-md'>try again</button></form>");
    }
}
%>
</body>
</html>