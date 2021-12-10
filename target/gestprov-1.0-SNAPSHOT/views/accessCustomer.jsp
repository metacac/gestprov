<%-- 
    Document   : user
    Created on : 5 dic. 2021, 16:20:14
    Author     : gerencia
--%>

<%@page import="database.CustomerDAO"%>
<%@page import="model.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

        <title>Acceso</title>
    </head>
    <body class="container text-center">
    <%  
        String email = request.getParameter("email");    //eliminar
        String pass = request.getParameter("password");
        CustomerDAO CustomerDB = new CustomerDAO();

        boolean exists = CustomerDB.login(email, pass);
        
        if (exists) {
    %>  
        <h1 class="m-5 text-success" >Acceso garantizado</h1>
        <h2 class="text-dark">Bienvenido al sistema</h2>
        <a href="../" class="text-primary"> Salir</a>
    <%
        } else {
    %>
        <h1 class="m-5 text-danger" >Acceso denegado</h1>
        <a href="../accessCustomer.app" class="text-primary"> Volver al login</a>
    <%
            }
    %> 
    </body>
</html>
