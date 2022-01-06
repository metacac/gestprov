<%-- 
    Document   : registration
    Created on : 10 dic. 2021, 18:27:04
    Author     : gerencia
session.setAttribute("isMessRegistered", true);
--%>

<%@include file="/WEB-INF/facelets/templates/partial/header.jsp" %>
<main class="container2" id="main-body">
    <form method="POST" action="/Customer/register" class="registro" name="registro"  id="regsitro">
        <!--inicio de contenedor formulario--> 
        <div class="container">
            <article class="tituloform">
                <h3 style="text-align: center">ALTA DE CLIENTE</h3>
                <!-- <h4>Formulario del cliente</h4> -->
                <p style="text-align: justify; font-size: 11px; color:gray">Estos datos son muy importantes, pueden servir de mecanismo de verificación de usuario.<br/>
                Como son en representación del cliente tenga muy en cuenta la información aca suministrada.<br/>
                Recuerde que los datos, a excepción  del cuit, son de la persona contacto.<br/>
                Preséntelos de forma que pueda recordarlos ya que serán ser usados como mecanismo de verificación oportunamente.</p>
            </article>
<% 
    boolean isMessNoRegistered = (boolean) session.getAttribute("isMessNoRegistered");
    
    if (isMessNoRegistered){
%>
             <div class="alert alert-danger alert-dimissible fade show d-flex justify-content-between" role="alert">
                <div><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x-circle" viewBox="0 0 16 16">
                        <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                        <path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
                        </svg>
                   No es posible realizar este registro para ese CUIT, ya que tiene un usuario asignado.</br>
                En unos segundos será redirigido a la pantalla para recuperar su clave si no la recuerda.</br>
                Si desea hacerlo más tarde, debe dirigirse al ingreso de usuario y luego a recuperar su contraseña.</div>
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
            <script>
                    setTimeout( () => window.location.href= "/Views/recovery",8000);
            </script>
<%
    session.setAttribute("isMessNoRegistered",false);}
    boolean isMessRegistered = (boolean) session.getAttribute("isMessRegistered");

    if (isMessRegistered){
%>
            <div class="alert alert-success alert-dimissible fade show d-flex justify-content-between" role="alert">
                <div><svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
                    <symbol id="check-circle-fill" fill="currentColor" viewBox="0 0 16 16">
                      <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z"/>
                    </symbol></svg>
                    Ha sido realizado el registro con éxito. Debes confirmar el correo electrónio.</br>
                    Por favor, revise su cuenta de correo para continuar.</br>
                    En unos segundos será redirigido a la pantalla inicio.</div>
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
            <script>
                setTimeout( () => window.location.href= "../index.jsp",8000);  
            </script>
<%
    session.setAttribute("isMessRegistered",false);}
%>
            <section class="row">
                <p style="text-align: center">Datos del cliente</p>
                <div class="col">
                    <p>Cuit</p>
                    <p style="font-size: 11px; color:gray">CUIT DE LA EMPRESA NO DEL CONTACTO</p>
                    <input type="number" name="cuit" class="form-control" placeholder="Cuit del cliente" aria-label="Cuit del cliente" id="cuit" required="required"/>
                    <span class="error" aria-live="polite" style="color: red"></span>
                </div>
                <div class="col">
                    <p>Correo electrónico</p>
                    <p style="font-size: 11px; color:gray">MINIMO REQUERIDO 8 CARACTERES</p>
                    <input type="email" name="email" class="form-control" placeholder="Correo electónico" aria-label="Correo electrónico" id="correo" required="required" minlength="8"/>
                    <span class="error" aria-live="polite" style= "color: red"></span>
                </div>
            </section>
            <section class="row">
                <p style="text-align: center">Datos de la persona contacto</p>
                <div class="col" id="container2a">
                    <p>Apellidos y Nombres</p>
                    <p style="font-size: 11px; color:gray">SE ACONSEJA QUE SEA COMO ESTÁ EN EL DNI DEL CONTACTO</p>
                    <input type="text" name="namesRepre" class="form-control" placeholder="Apellidos y Nombres" aria-label="Apellidos y Nombres" id="namesRepre" required="required"/>
                    <span class="error" aria-live="polite" style= "color: red"></span>
                </div>
                <div class="col">
                    <p>Teléfono celular</p>
                    <p style="font-size: 11px; color:gray">CÓDIGO DE ÁREA Y NÚMERO SIN ESPACIOS EJEM 91112345678</p>
                    <input type="tel" name="celular" class="form-control" placeholder="Teléfono celular" aria-label="Teléfono celular" id="celular" required="required"/>
                    <span class="error" aria-live="polite" style="color: red"></span>
                </div>
            </section>
            <section class="row">
                <div class="col">
                    <p>Contraseña</p>
                    <input type="text" name="password" class="form-control" placeholder="Contraseña" aria-label="Contraseña" id="password" required="required" minlength="8"/>
                    <span class="error" aria-live="polite" style="color: red"></span>
                </div>
<!--                <div class="col" style="width: 10%" >
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" style="color: red" class="bi bi-x-circle" viewBox="0 0 16 16">
                    <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                    <path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
                    </svg>
                </div>-->
                <div class="col">
                    <p>Repita la contraseña</p>
                    <input type="text" class="form-control" placeholder="Repita la Contraseña" aria-label="Repita la Contraseña" id="passwordRepetida"  minlength="8"/>
                    <span class="error" aria-live="polite" style= "color: red"></span>
                </div>
            </section>
            <section style="text-align: center" class="row">
                <%
    boolean isMessNoRepeteadPass = (boolean) session.getAttribute("isMessNoRepeteadPass");
    
    if (isMessNoRepeteadPass){
%>
             <div class="alert alert-warning alert-dimissible fade show d-flex justify-content-around" role="alert">
                <div><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x-circle" viewBox="0 0 16 16">
                        <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                        <path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
                        </svg>
                   No es posible realizar este registro porque las contraseñas deben coincidir.</br>
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
<%
    session.setAttribute("isMessNoRepeteadPass", false);}
%>
                <div class="col">
                    <span class="errorC"  id="passwordC" aria-live="polite" style="color: red; font-size: 0.8em "></span>
                </div>
            </section>
            <section class="row">
                <div class="col">
                    <div class="d-grid gap-2">
                        <button type="reset" class="btn btn-danger" id="borrado">Borrar</button>
                    </div>
                </div>
                <div class="col">
                    <div class="d-grid gap-2">
                        <button type="submit" class="btn btn-primary" id="enviar">Enviar información</button>
                    </div>
                </div>
            </section>
        </div>
        <!-- fin de contenedor formulario -->
    </form>
</main>
<%@include file="/WEB-INF/facelets/templates/partial/footer.jsp" %>