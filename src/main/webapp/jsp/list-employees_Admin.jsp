<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
       <c:url value="/css/bootstrap.min.css" var="mainCssUrl" />
       <link rel="stylesheet" href="${mainCssUrl}" />

       <c:url value="/js/jquery-1.9.1.min.js" var="jqueryUrl" />
       <script src="${jqueryUrl}"></script>  
        
       <c:url value="/js/bootstrap.min.js" var="bootstrapUrl" />
       <script src="${bootstrapUrl}"></script> 
       <title>Employee List (Admin)</title>
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
<style>
a {
    text-decoration: none;
    display: inline-block;
    padding: 8px 16px;
}
a:hover {
    background-color: #ddd;
    color: black;
}
.logout {
    background-color: #f1f1f1;
    color: black;
  	border-radius: 15px;
  	box-shadow: 1px 3px #999;
    float: right;
    margin: 40px 70px 30px 30px;
}
#logout {
}
</style>
 
          
    </head>

    <body>  
            
	<div id="logout"><a href="${pageContext.request.contextPath}/jsp/logout.jsp" class="logout">Logout</a></div>
        <div class="container">
           <h2>Employees</h2><h3>(Eingeloggt als Admin)</h3>
            <!--Search Form -->
            <form action="${pageContext.request.contextPath}/admin/" method="get" id="seachEmployeeForm" role="form">
                <input type="hidden" id="searchAction" name="searchAction" value="searchByName">
                <div class="form-group col-xs-5">
                    <input type="text" name="employeeName" id="employeeName" class="form-control" required="true" placeholder="Type the Name or Last Name of the employee"/>                    
                </div>
                <button type="submit" class="btn btn-info">
                    <span class="glyphicon glyphicon-search"></span> Search
                </button>
                <br>
                <br>
            </form>

            <!--Employees List-->
            <c:if test="${not empty message}">                
                <div class="alert alert-success">
                    ${message}
                </div>
            </c:if> 
            <form action="${pageContext.request.contextPath}/admin/" method="post" id="employeeForm" role="form" >              
                <input type="hidden" id="idEmployee" name="idEmployee">
                <input type="hidden" id="action" name="action">
                <c:choose>
                    <c:when test="${not empty employeeList}">
                        <table id="employees-table" class="table table-striped">
                            <thead>
                                <tr>
                                    <td>#</td>
                                    <td>Anrede</td>
                                    <td>Name</td>
                                    <td>Last name</td>
                                    <td>Birth date</td>
                                    <td>Role</td>
                                    <td>Department</td>
                                    <td>E-mail</td>
                                    <td>Telefon</td>
                                    <td></td>
                                </tr>
                            </thead>
                            <c:forEach var="employee" items="${employeeList}">
                                <c:set var="classSucess" value=""/>
                                <c:if test ="${idEmployee == employee.id}">                        	
                                    <c:set var="classSucess" value="info"/>
                                </c:if>
                                <tr class="${classSucess}">
                                    <td>
                                        <a href="${pageContext.request.contextPath}/employee/?idEmployee=${employee.id}&searchAction=searchById">${employee.id}</a>
                                    </td>    
                                    <td>${employee.anrede}</td>                                
                                    <td>${employee.name}</td>
                                    <td>${employee.lastName}</td>
                                    <td>${employee.birthDate}</td>
                                    <td>${employee.role}</td>
                                    <td>${employee.department}</td>
                                    <td>${employee.email}</td>   
                                    <td>${employee.telefon}</td> 
                                    <td><a href="#" id="remove" 
                                           onclick="document.getElementById('action').value = 'remove';document.getElementById('idEmployee').value = '${employee.id}';
                                                    
                                                    document.getElementById('employeeForm').submit();"> 
                                            <span class="glyphicon glyphicon-trash"></span>
                                        </a>
                                                   
                                    </td>
                                </tr>
                            </c:forEach>               
                        </table>  
                    </c:when>                    
                    <c:otherwise>
                        <br>           
                        <div class="alert alert-info">
                            No people found matching your search criteria
                        </div>
                    </c:otherwise>
                </c:choose>                        
            </form>
            <form action ="${pageContext.request.contextPath}/jsp/new-employee.jsp">            
                <br>
                <button type="submit" class="btn btn-primary  btn-md">New employee</button> 
            </form>
        </div>
    </body>
</html>