<%-- 
    Document   : custinformation
    Created on : 14 dic. 2021, 09:00:28
    Author     : gerencia
--%>

<%@page import="model.Information"%>
<%@page import="model.Customer"%>
<%@include file="/WEB-INF/facelets/templates/partialApp/headerApp.jsp" %>
<main>
    <form method="POST" action="/Login/custInforEdit">
        <!--inicio de contenedor formulario--> 
        <div class="container">
            <article class="tituloform">
                <h3 style="text-align: center">EDICIÓN DE DATOS DEL CLIENTE</h3>
                <h4 style="text-align: center">Información de la empresa</h4>
            </article>
            <h4>Datos fiscales de la empresa</h4>
            <%  
            
            
            boolean isLogged = (boolean) session.getAttribute("isLogin");

            if (isLogged) {
                Customer customer = (Customer) session.getAttribute("customer");
                Information information = (Information) session.getAttribute("information");
                
            %>  
            <section class="row">
                <div class="col">
                    <p>Cuit de la empresa</p>
                    <input type="text" name="cuit" class="form-control" style="color:gray" value="<% out.print(customer.getCuit()); %>" aria-label="Cuit del cliente" id="cuit" disabled/>
                    <span class="error" aria-live="polite" style="color: red"></span>
                </div>
                <div class="col">
                    <p>Nombre Fiscal de la empresa</p>
                    <input type="text" name="companyName" class="form-control" placeholder="<% out.print(information.getCompanyName()); %>" aria-label="Nombre fiscal de la empresa" id="company_name" disabled/>
                    <span class="error" aria-live="polite" style= "color: red"></span>
                </div>
            </section>
            <h4>Datos de la dirección fiscal de empresa</h4>
            <section class="row">
                <div class="col">
                    <p>País</p>
                    <input type="text" name="country" class="form-control" value="<% out.print(information.getCountry()); %>" aria-label="País" id="country"/>
                    <span class="error" aria-live="polite" style= "color: red"></span>
                </div>
                <div class="col">
                    <p>Ciudad</p>
                    <input type="text" name="city" class="form-control" value="<% out.print(information.getCity()); %>" aria-label="Ciudad" id="city"/>
                    <span class="error" aria-live="polite" style= "color: red"></span>
                </div>
                <div class="col">
                    <p>Dirección</p>
                    <input type="text" name="direction" class="form-control" value="<% out.print(information.getDirection()); %>" aria-label="Dirección" id="direction"/>
                    <span class="error" aria-live="polite" style= "color: red"></span>
                </div>
            </section>
            <section class="row">
                <div class="col">
                    <p>Teléfono de la empresa</p>
                    <input type="text" name="phone" class="form-control" value="<% out.print(information.getPhone()); %>" aria-label="Télefono de contacto en la empresa" id="phone"/>
                    <span class="error" aria-live="polite" style= "color: red"></span>
                </div>
                <div class="col">
                    <p>Código Postal</p>
                    <input type="text" name="postalCode" class="form-control" value="<% out.print(information.getPostalCode()); %>" aria-label="Código Postal" id="postal_code"/>
                    <span class="error" aria-live="polite" style="color: red"></span>
                </div>
            </section>
            <h4>Datos de la representación de la empresa y sus datos en la aplicación</h4>
            <section class="row">
                <div class="col">
                    <p>Nombre de usario de la empresa</p>
                    <input type="text" name="namesCust" class="form-control" placeholder="<% out.print(information.getNamesCust()); %>" aria-label="Nombre de usario de la empresa" id="names_cust" disabled/>
                    <span class="error" aria-live="polite" style= "color: red"></span>
                </div>
                <div class="col">
                    <p>Correo de la persona contacto</p>
                    <input type="email" name="email" class="form-control" placeholder="<% out.print(customer.getEmail()); %>" aria-label="Correo electrónico" id="email" disabled/>
                    <span class="error" aria-live="polite" style= "color: red"></span>
                </div>
            </section>
            <section class="row">
                <div class="col" id="container2a">
                    <p>Apellidos y Nombres la persona contacto</p>
                    <input type="text" name="namesRepre" class="form-control" placeholder="<% out.print(customer.getNamesRepre()); %>" aria-label="Apellidos y Nombres" id="names_repre" disabled/>
                    <span class="error" aria-live="polite" style= "color: red"></span>
                </div>
                <div class="col">
                    <p>Telefóno móvil de la persona contacto</p>
                    <input type="number" name="celular" class="form-control" placeholder="<% out.print(customer.getCelular()); %>" aria-label="celular" id="celular" disabled/>
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
                    <input type="text" name="typeCust" class="form-control" value="<% out.print(information.getTypeCust()); %>" aria-label="Tipo de servicio que desea recibir o prestar" id="type_cust"/>
                    <span class="error" aria-live="polite" style="color: red"></span>
                </div>
                <div class="col">
<!--                </div>
                <div class="col">
                    <input type="radio" name="proveedor" class="form-check-input" aria-label="Proveedor" id="proveedor" />
                    <label class="form-check-label" for="proveedor">Proveedor</label>
                </div>
                <div class="col">
                    <input type="radio" name="rece_proveedor" class="form-check-input" aria-label="Receptor de provedores" id="rece_proveedor"/>
                    <label class="form-check-label" for="proveedor">Receptor de provedores</label>
                </div>
                <div class="col">
                    <input type="radio" name="ambos" class="form-check-input" aria-label="Ambos" id="ambos" checked/>
                    <label class="form-check-label" for="ambos">Ambos</label>
                </div>-->
            </section>
            <section class="row">
                <div class="col">
                    <div class="d-grid gap-2">
                        <button type="submit" class="btn btn-success">Guardar cambios</button>
                    </div>
                </div>
                <div class="col">
                    <div class="d-grid gap-2">
                        <button type="submit" formaction="/Login/custInfor" class="btn btn-warning" id="borrado">Descartar cambios</button>
                    </div>
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
      setTimeout( () => window.location.href= "/Views/login",1500);  
    </script>
    <a href="/Views/login" class="text-primary"> Volver al login</a>
    <%
        }
    %> 

<%@include file="/WEB-INF/facelets/templates/partialApp/footerApp.jsp" %>