<%-- 
    Document   : custinformation
    Created on : 14 dic. 2021, 09:00:28
    Author     : gerencia
<%= cuitNum %>,  <%= phone %>, <%= direction %>,<%= postalCode %>, <%= city %>, <%= country %>, <%= typeCust %>
--%>

<%@page import="database.AccountDAO"%>
<%@page import="model.Information"%>
<%@page import="model.Customer"%>
<%@include file="/WEB-INF/facelets/templates/partialApp/headerApp.jsp" %>
<main>
    <form method="POST" action="/Login/inforEdit">
        <!--inicio de contenedor formulario--> 
        <div class="container">
            <article class="tituloform">
                <h3 style="text-align: center">DATOS DEL CLIENTE</h3>
                <h4 style="text-align: center">Información de la empresa</h4>
            </article>
            <section class="row">
                <div class="col">
                    <div class="d-grid gap-2" style="width: 100%">
                        <button type="submit" class="btn btn-primary">Editar</button>
                    </div>
                </div>
            </section>
            <h4>Datos fiscales de la empresa</h4>
            <%  

            boolean isLogged = (boolean) session.getAttribute("isLogin");

            if (isLogged) {
                AccountDAO AccountDB = new AccountDAO();
                Customer customer = (Customer) session.getAttribute("customer");
                Information information = AccountDB.getInformationByEmail(customer.getEmail());
                session.setAttribute("information",information);
                boolean isMessRegisteredOk = (boolean) session.getAttribute("isMessRegisteredOk");
    
                if (isMessRegisteredOk){
                    String cuit = (String) session.getAttribute("cuit");
                    String phone = (String) session.getAttribute("phone");
                    String direction = (String) session.getAttribute("direction");
                    String postalCode = (String) session.getAttribute("postalCode");
                    String city = (String) session.getAttribute("city");
                    String country = (String) session.getAttribute("country");
                    String typeCust = (String) session.getAttribute("typeCust");
%>
        <div class="container">
            <div class="alert alert-success alert-dimissible fade show d-flex justify-content-between" role="alert">
                <div><svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
                    <symbol id="check-circle-fill" fill="currentColor" viewBox="0 0 16 16">
                      <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z"/>
                    </symbol></svg>
                    Ha sido realizado con éxito el registro.</br>
                    <!--En unos segundos será redirigido a la pantalla inicio.-->
                    <%= cuit %>,  <%= phone %>, <%= direction %>,<%= postalCode %>, <%= city %>, <%= country %>, <%= typeCust %>
                </div>
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        </div>
            <script>
                //setTimeout( () => window.location.href= "/login/custInformation.jsp",3000);
            </script>
<%
    session.setAttribute("isMessRegisteredOk",false);}
%>
            <section class="row">
                <div class="col">
                    <p>Cuit de la empresa</p>
                    <input type="number" name="cuit" class="form-control-plaintext" placeholder="<%= customer.getCuitCus() %>" aria-label="Cuit del cliente" id="cuit" disabled/>
                    <span class="error" aria-live="polite" style="color: red"></span>
                </div>
                <div class="col">
                    <p>Nombre Fiscal de la empresa</p>
                    <input type="text" name="companyName" class="form-control-plaintext" placeholder="<%= information.getCompanyName() %>" aria-label="Nombre fiscal de la empresa" id="companyName" disabled/>
                    <span class="error" aria-live="polite" style= "color: red"></span>
                </div>
            </section>
            <h4>Datos de la dirección fiscal de empresa</h4>
            <section class="row">
                <div class="col">
                    <p>País</p>
                    <input type="text" name="country" class="form-control-plaintext" placeholder="<%= information.getCountry() %>" aria-label="País" id="country" disabled/>
                    <span class="error" aria-live="polite" style= "color: red"></span>
                </div>
                <div class="col">
                    <p>Ciudad</p>
                    <input type="text" name="city" class="form-control-plaintext" placeholder="<%= information.getCity() %>" aria-label="Ciudad" id="city" disabled/>
                    <span class="error" aria-live="polite" style= "color: red"></span>
                </div>
                <div class="col">
                    <p>Dirección</p>
                    <input type="text" name="direction" class="form-control-plaintext" placeholder="<%= information.getDirection() %>" aria-label="Dirección" id="direction" disabled/>
                    <span class="error" aria-live="polite" style= "color: red"></span>
                </div>
            </section>
            <section class="row">
                <div class="col">
                    <p>Teléfono de la empresa</p>
                    <input type="number" name="phone" class="form-control-plaintext" placeholder="<%= information.getPhone() %>" aria-label="Télefono de contacto en la empresa" id="phone" disabled/>
                    <span class="error" aria-live="polite" style= "color: red"></span>
                </div>
                <div class="col">
                    <p>Código Postal</p>
                    <input type="number" name="postalCode" class="form-control-plaintext" placeholder="<%= information.getPostalCode() %>" aria-label="Código Postal" id="postalCode" disabled/>
                    <span class="error" aria-live="polite" style="color: red"></span>
                </div>
            </section>
            <h4>Datos de la representación de la empresa y sus datos en la aplicación</h4>
            <section class="row">
                <div class="col">
                    <p>Nombre de usario de la empresa</p>
                    <input type="text" name="namesCust" class="form-control-plaintext" placeholder="<%= information.getNamesCust() %>" aria-label="Nombre de usario de la empresa" id="namesCust" disabled/>
                    <span class="error" aria-live="polite" style= "color: red"></span>
                </div>
                <div class="col">
                    <p>Correo de la persona contacto</p>
                    <input type="email" name="email" class="form-control-plaintext" placeholder="<%= customer.getEmail() %>" aria-label="Correo electrónico" id="email" disabled/>
                    <span class="error" aria-live="polite" style= "color: red"></span>
                </div>
            </section>
            <section class="row">
                <div class="col" id="container2a">
                    <p>Apellidos y Nombres la persona contacto</p>
                    <input type="text" name="namesRepre" class="form-control-plaintext" placeholder="<%= customer.getNamesRepre() %>" aria-label="Apellidos y Nombres" id="namesRepre" disabled/>
                    <span class="error" aria-live="polite" style= "color: red"></span>
                </div>
                <div class="col">
                    <p>Telefóno móvil de la persona contacto</p>
                    <input type="number" name="celular" class="form-control-plaintext" placeholder="<%= customer.getCelular() %>" aria-label="celular" id="celular" disabled/>
                    <span class="error" aria-live="polite" style="color: red"></span>
                </div>
            </section>
            <section class="row">
                <p>Tipo de servicio que desea recibir o prestar</p>
            </section>
            <section class="row">
                <div class="col">
                </div>
                <div class="col">
                    <input type="text" name="typeCust" class="form-control-plaintext" placeholder="<%= information.getTypeCust() %>" aria-label="Tipo de servicio que desea recibir o prestar" id="typeCust" disabled/>
                    <span class="error" aria-live="polite" style="color: red"></span>
                </div>
                <div class="col">
                </div>
<!--                <div class="col">
                    <input type="radio" name="proveedor" class="form-check-input" aria-label="Proveedor" id="Proveedor" value = "Proveedor" disabled/>
                    <label class="form-check-label" for="proveedor">Proveedor</label>
                </div>
                <div class="col">
                    <input type="radio" name="rece_proveedor" class="form-check-input" aria-label="Receptor de provedores" id="Rece_proveedor" value = "Receptor de provedores" disabled/>
                    <label class="form-check-label" for="rece_proveedor">Receptor de provedores</label>
                </div>
                <div class="col">
                    <input type="radio" name="ambos" class="form-check-input" aria-label="Ambos" id="Ambos" value = "Ambos" disabled/>
                    <label class="form-check-label" for="ambos">Ambos</label>
                </div>-->
            </section>
        </div>
        <!-- fin de contenedor formulario -->
    </form>
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