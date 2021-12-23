<%-- 
    Document   : zone
    Created on : 14 dic. 2021, 08:45:11
    Author     : gerencia

(int i=0, n = invoicesDB.length; i< n; i++){
--%>

<%@page import="java.util.List"%>
<%@page import="model.Invoices"%>
<%@page import="model.Customer"%>
<%@page import="database.AccountDAO"%>
<%@include file="/WEB-INF/facelets/templates/partialApp/headerApp.jsp" %>
<main class="container" id="main-body">
<%     
        
        boolean isLogged = (boolean) session.getAttribute("isLogin");

        if (isLogged) {
            Customer customer = (Customer) session.getAttribute("customer");
            long cuit = customer.getCuit();
            AccountDAO AccountDB = new AccountDAO();
            
            List<Invoices> toInvoicesDB = AccountDB.getToInvoices(cuit);
            session.setAttribute("toInvoicesDB", toInvoicesDB);
            
            List<Invoices> fromInvoicesDB = AccountDB.getFromInvoices(cuit);
            session.setAttribute("fromInvoicesDB", fromInvoicesDB);
%>
    <table class="table table-dark table-striped">
        <h4 style="text-align: center">Facturas por Pagar</h4>
  <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col" style="text-align: center">N° Operación</th>
      <th scope="col"style="align-content: center">Cliente</th>
      <th scope="col" style="text-align: center">Fecha</br>Expedición</th>
      <th scope="col" style="text-align: center">Fecha</br>Vencimiento</th>
      <th scope="col"style="text-align: center">Monto ($)</th>
      <th scope="col" style="text-align: center">Estatus</br>Vencimiento</th>
      <th scope="col" style="text-align: center">Estatus</br>Pago</th>
      <td colspan="2" style="text-align: center;  font-weight: bolder">Acciones</td>
    </tr>
  </thead>
  <tbody>
    <tr>
<%
    for(Invoices item:toInvoicesDB) {
%>
<tr>
      <td scope="row">#</td>
      <td><% out.print(item.getOperationNum()); %></td>
      <td><% out.print(item.getInvoiceNum()); %></td>
      <td><% out.print(item.getDateIssue()); %></td>
      <td><% out.print(item.getDateExpire()); %></td>
      <td><% out.print(item.getPayTotal()); %></td>
      <td><% out.print(AccountDB.statusCal(item.getDateExpire())); %></td>
      <td>
          <a href="#"><svg xmlns="http://www.w3.org/2000/svg" style="color: cornflowerblue" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
            <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
            <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
          </svg></a>
          <span><% out.print(item.getStatusInvoice()); %></span>
      </td>
      <td>
          <a class="btn btn-warning btn.sm">Editar</a>
      </td>
<!--      <td>
          <a class="btn btn-primary btn.sm">Actualizar</a>
      </td>-->
      <td>
          <a class="btn btn-danger btn.sm">Eliminar</a>
      </td>
    </tr>
<%
    }
%>

<table class="table table-dark table-striped">
        <h4 style="text-align: center">Facturas por Cobrar</h4>
  <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col" style="text-align: center">N° Operación</th>
      <th scope="col"style="align-content: center">Cliente</th>
      <th scope="col" style="text-align: center">Fecha</br>Expedición</th>
      <th scope="col" style="text-align: center">Fecha</br>Vencimiento</th>
      <th scope="col"style="text-align: center">Monto ($)</th>
      <th scope="col" style="text-align: center">Estatus</br>Vencimiento</th>
      <th scope="col" style="text-align: center">Estatus</br>Cobro</th>
      <td colspan="2" style="text-align: center;  font-weight: bolder">Acciones</td>
    </tr>
  </thead>
  <tbody>
    <tr>
<%
    for(Invoices item:fromInvoicesDB) {
%>
<tr>
      <td scope="row">#</td>
      <td><% out.print(item.getOperationNum()); %></td>
      <td><% out.print(item.getInvoiceNum()); %></td>
      <td><% out.print(item.getDateIssue()); %></td>
      <td><% out.print(item.getDateExpire()); %></td>
      <td><% out.print(item.getPayTotal()); %></td>
      <td><% out.print(AccountDB.statusCal(item.getDateExpire())); %></td>
      <td>
          <a href="#"><svg xmlns="http://www.w3.org/2000/svg" style="color: cornflowerblue" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
            <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
            <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
          </svg></a>
          <span><% out.print(item.getStatusInvoice()); %></span>
      </td>
      <td>
          <a class="btn btn-warning btn.sm">Editar</a>
      </td>
<!--      <td>
          <a class="btn btn-primary btn.sm">Actualizar</a>
      </td>-->
      <td>
          <a class="btn btn-danger btn.sm">Eliminar</a>
      </td>
    </tr>
<%
    }
%>
  </tbody>
</table>
    
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
