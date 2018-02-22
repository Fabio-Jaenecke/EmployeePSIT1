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
        <title>Neuer Mitarbeiter</title>
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
        <div class="container">
            <form action="${pageContext.request.contextPath}/admin/" method="post"  role="form" data-toggle="validator" >
                <c:if test ="${empty action}">                        	
                    <c:set var="action" value="add"/>
                </c:if>
                <input type="hidden" id="action" name="action" value="${action}">
                <input type="hidden" id="idEmployee" name="idEmployee" value="${employee.id}">
                <h2>Employee</h2>
                <div class="form-group col-xs-4">
                
                    <label for="anrede" class="control-label col-xs-4">Anrede:</label>
                    <input type="text" name="anrede" id="anrede" class="form-control" value="${employee.anrede}" placeholder="Herr/Frau" required="true"/>
                
                    <label for="name" class="control-label col-xs-4">Name:</label>
                    <input type="text" name="name" id="name" class="form-control" value="${employee.name}" required="true"/>                                   

                    <label for="lastName" class="control-label col-xs-4">Last name:</label>                   
                    <input type="text" name="lastName" id="lastName" class="form-control" value="${employee.lastName}" required="true"/> 

                    <label for="birthdate" class="control-label col-xs-4">Birth date</label>                 
                    <input type="text"  pattern="^\d{2}-\d{2}-\d{4}$" name="birthDate" id="birthdate" class="form-control" value="${employee.birthDate}" maxlength="10" placeholder="dd-MM-yyyy" required="true"/>

                    <label for="role" class="control-label col-xs-4">Role:</label>                    
                    <input type="text" name="role" id="role" class="form-control" value="${employee.role}" required="true"/> 

                    <label for="department" class="control-label col-xs-4">Department:</label>
                    <input type="text" name="department" id="department" class="form-control" value="${employee.department}" required="true"/>

                    <label for="department" class="control-label col-xs-4">E-mail:</label>                   
                    <input type="text" name="email" id="email" class="form-control" value="${employee.email}" placeholder="smith@aol.com" required="true"/>

					<label for="department" class="control-label col-xs-4">Telefon:</label>                   
                    <input type="text" name="telefon" id="telefon" class="form-control" value="${employee.telefon}" placeholder="z.B. 079-907-51-92" required="true"/>

                    <br>
                    <button type="submit" class="btn btn-primary  btn-md">Accept</button> 
                </div>                                                      
            </form>
        </div>
    </body>
</html>