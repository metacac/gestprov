<%-- 
    Document   : recover
    Created on : 10 dic. 2021, 22:09:30
    Author     : gerencia
--%>

<%@include file="/WEB-INF/facelets/templates/partial/header.jsp" %>
<main class="container" id="main-body">
    <form method="POST" action="/Customer/recover" class="ingreso" id="ingreso">
        <!--inicio de contenedor 2 formulario--> 
        <div class="container">
            <article class="tituloform">
                <h3 style="text-align: center">RECUPERACIÓN DE ACCESO AL SISTEMA</h3>
                <h4 style="text-align: center">Bienvenido al sistema</h4>
            </article>
<% 
    boolean isMessNoRecovered = (boolean) session.getAttribute("isMessNoRecovered");
    
    if (isMessNoRecovered){
%>
             <div class="alert alert-danger alert-dimissible fade show d-flex justify-content-between" role="alert">
                <div><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x-circle" viewBox="0 0 16 16">
                        <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                        <path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
                        </svg>
                   Hay inconsistencia entre los datos que están en nuestras cuentas y los aportados.</br>
                Nos comunicameremos con ud. oportunamente para resolver el problema.</div>
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
            <script>
                //setTimeout( () => window.location.href= "../index.jsp",1500);  
            </script>
<%
    session.setAttribute("isMessNoRecovered",false);}
    boolean isMessRecovered = (boolean) session.getAttribute("isMessRecovered");

    if (isMessRecovered){
%>
            <div class="alert alert-success d-flex justify-content-between" role="alert">
                <div><svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
                    <symbol id="check-circle-fill" fill="currentColor" viewBox="0 0 16 16">
                      <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z"/>
                    </symbol></svg>
                   Ha sido realizada la consulta. Debes confirmar el correo electrónio.</br>
                Por favor, revise su cuenta de correo para continuar.</br>
                </div>
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
            <script>
                //setTimeout( () => window.location.href= "../index.jsp",7000);  
            </script>
<%
    session.setAttribute("isMessRecovered",false);}
%>
            <section class="row">
                <div class="col">
                    <p>Ingrese el Cuit de la empresa que representa</p>
                    <input type="number" name="cuit" class="form-control" placeholder="Ingrese el cuit de la empresa" aria-label="Ingrese el cuit de la empresa" id="cuit" required="required"/>
                </div>
            </section>
            <section class="row">
                <div class="col">
                    <p>Ingrese el Correo electrónico de registro original</p>
                    <input type="email" name="email" class="form-control" placeholder="Ingrese el Correo electrónico de registro original" aria-label="Ingrese el Correo electrónico de registro original" id="email" required="required"/>
                </div>
            </section>
            <section class="row">
                <div class="col">
                    <div class="d-grid gap-2">
                        <button type="submit" class="btn btn-primary" id="recuperar">Enviar información</button>
                    </div>
                </div>
            </section>           
        </div>
        <!-- fin de contenedor 4 formulario -->
    </form>
</main>
<%@include file="/WEB-INF/facelets/templates/partial/footer.jsp" %>