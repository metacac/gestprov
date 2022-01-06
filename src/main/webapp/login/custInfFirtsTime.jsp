<%-- 
    Document   : custInfFirtsTime
    Created on : 5 ene. 2022, 09:53:52
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
                <h3 style="text-align: center">DATOS COMPLETOS DEL CLIENTE</h3>
                <h4 style="text-align: center">Información de la empresa</h4>
            </article>
            <section class="row">
                <div class="col">
                    <div class="d-grid gap-2" style="width: 100%">
                        <button type="submit" class="btn btn-success">Registrar</button>
                    </div>
                </div>
            </section>
            <h4>Datos fiscales de la empresa</h4>
            <%  

            boolean isLogged = (boolean) session.getAttribute("isLogin");

            if (isLogged) {
                AccountDAO AccountDB = new AccountDAO();
                Customer customer = (Customer) session.getAttribute("customer");
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
                <div class="col">Tipo de servicio que desea recibir o prestar</div>
<!--                <div class="col">
                </div>-->
<!--                <div class="col">
                    <input type="text" name="typeCust" class="form-control-plaintext" placeholder="" aria-label="Tipo de servicio que desea recibir o prestar" id="typeCust"/>
                    <span class="error" aria-live="polite" style="color: red"></span>
                </div>-->
                <div class="col">
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="supplierProvider" aria-label="Proveedor" id="supplier" value = "proveedor"/>
                        <label class="form-check-label" for="supplier">Proveedor</label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="supplierProvider" aria-label="Receptor de provedores" id="provider" value = "prestador"/>
                        <label class="form-check-label" for="provider">Prestador</label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="supplierProvider" aria-label="Ambos" id="both" value = "ambos" checked/>
                        <label class="form-check-label" for="both">Ambos</label>
                    </div>
                </div>
            </section>
            <section class="row">
                <div class="col">
                    <p>Cuit de la empresa</p>
                    <input type="number" name="cuit" class="form-control-plaintext" placeholder="<%= customer.getCuitCus() %>" aria-label="Cuit del cliente" id="cuit" disabled/>
                    <span class="error" aria-live="polite" style="color: red"></span>
                </div>
                <div class="col">
                    <p>Nombre Fiscal de la empresa</p>
                    <input type="text" name="companyName" class="form-control" placeholder="Escriba el nombre fiscal" aria-label="Nombre fiscal de la empresa" id="companyName" required/>
                    <span class="error" aria-live="polite" style= "color: red"></span>
                </div>
            </section>
            <h4>Datos de la dirección fiscal de empresa en sede principal</h4>
            <section class="row">
                <div class="col">
                    <p>País sede</p>
                    <input type="text" name="country" class="form-control" placeholder="Escriba el país" aria-label="Escriba el país" id="country" required/>
                    <span class="error" aria-live="polite" style= "color: red"></span>
                </div>
                <div class="col">
                    <p>Ciudad sede</p>
                    <input type="text" name="city" class="form-control" placeholder="Escriba la ciudad" aria-label="Escriba la ciudad" id="city" required/>
                    <span class="error" aria-live="polite" style= "color: red"></span>
                </div>
                <div class="col">
                    <p>Dirección</p>
                    <input type="text" name="direction" class="form-control" placeholder="Escriba la dirección (calle Número)" aria-label="Escriba la dirección (calle Número)" id="direction" required/>
                    <span class="error" aria-live="polite" style= "color: red"></span>
                </div>
            </section>
            <section class="row">
                <div class="col">
                    <p>Teléfono de la empresa</p>
                    <input type="type" name="phone" class="form-control" placeholder="Escriba un teléfono fijo" aria-label="Escriba un teléfono fijo" id="phone" required/>
                    <span class="error" aria-live="polite" style= "color: red"></span>
                </div>
                <div class="col">
                    <p>Código Postal</p>
                    <input type="number" name="postalCode" class="form-control" placeholder="Escriba el código postal" aria-label="Escriba el código postal" id="postalCode" required/>
                    <span class="error" aria-live="polite" style="color: red"></span>
                </div>
            </section>
            <h4>Datos de la representación de la empresa y sus datos en la aplicación</h4>
            <section class="row">
                <div class="col">
                    <p>Nombre de usuario de la empresa</p>
                    <input type="text" name="namesCust" class="form-control" placeholder="Escriba el nombre de usuario" aria-label="Nombre de usario de la empresa" id="namesCust" required/>
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
                    <input type="tel" name="celular" class="form-control-plaintext" placeholder="<%= customer.getCelular() %>" aria-label="celular" id="celular" disabled/>
                    <span class="error" aria-live="polite" style="color: red"></span>
                </div>
            </section>
            <section class="row">
                <div class="col">
                    <p>Situación ante el IVA</p>
                    <input type="text" name="statusIVA" class="form-control" placeholder="Escriba la situación ante el IVA" aria-label="Situación ante el IVA" id="statusIVA" required/>
                    <span class="error" aria-live="polite" style="color: red"></span>
                </div>
                <div class="col">
                    <p>Condición frente a retenciones</p>
                    <input type="text" name="statusING" class="form-control" placeholder="Escriba la condición frente a retenciones" aria-label="Condición frente a retenciones" id="statusING" required/>
                    <span class="error" aria-live="polite" style= "color: red"></span>
                </div>
            </section>
            <section class="row">
                <div class="col">
                    <p>Fecha de inicio de actividad</p>
                    <input type="date" name="dateStart" style="color:grey;" class="form-control" placeholder="Escriba la fecha de inicio de actividad" aria-label="Fecha de inicio de actividad" id="dateStart" required/>
                    <span class="error" aria-live="polite" style="color: red"></span>
                </div>
                <div class="col">
                    <p>Tipo de actividad</p>
                    <input type="text" name="typeActivity" class="form-control" placeholder="Escriba el tipo de actividad" aria-label="Tipo de actividad" id="typeActivity" required/>
                    <span class="error" aria-live="polite" style="color: red"></span>
                </div>
            </section>
            <section class="row">
                <div class="col">
                    <p>Descripción de la actividad</p>
                    <textarea name="descriptionActivity" class="form-control" rows="5" placeholder=Descripción de la actividad de la empresa" aria-label="Descripción de la actividad" id="descriptionActivity" required></textarea>
                    <span class="error" aria-live="polite" style= "color: red"></span>
                </div>
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