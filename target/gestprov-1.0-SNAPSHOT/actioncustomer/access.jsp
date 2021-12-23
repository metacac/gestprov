<%-- 
    Document   : user
    Created on : 5 dic. 2021, 16:20:14
    Author     : gerencia
--%>

<%@page import="database.AccountDAO"%>
<%@page import="database.CustomerDAO"%>
<%@page import="model.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/facelets/templates/partialApp/headerApp.jsp" %>

<main class="container text-center">
<%     
        
        boolean isLogged = (boolean) session.getAttribute("isLogin");

        if (isLogged) {
            AccountDAO AccountDB = new AccountDAO();
            Customer customer = (Customer) session.getAttribute("customer");
            Information information = AccountDB.getInformationByEmail(customer.getEmail());
            session.setAttribute("information",information);
%> 
    <h1 class="m-5 text-success" >Acceso garantizado</h1>
    <h2 class="text-dark">Bienvenido <% out.print(information.getNamesCust()); %> al sistema</h2>
    <p>Será redirigido a su zona de usuario</p>
    <script>
      setTimeout( () => window.location.href= "/Login/zone",1500);  
    </script>
    <p>Si desea puede</p>
    <a href="/Login/logout" class="text-primary"> Salir</a>
<%
    } else { 
%>
    
    <h1 class="m-5 text-danger" >Debes estar logeado para acceder a esta página</h1>
    <script>
      //setTimeout( () => window.location.href= "/Views/login",1500);  
    </script>
    <a href="/Views/login" class="text-primary"> Volver al login</a>
    
<%
    }
%>
    
</main>
<%@include file="/WEB-INF/facelets/templates/partialApp/footerApp.jsp" %>
