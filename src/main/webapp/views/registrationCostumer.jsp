<%-- 
    Document   : registrationCostumer
    Created on : 8 dic. 2021, 21:11:10
    Author     : gerencia
--%>

<%@page import="model.SendMail"%>
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
        <h1 class="m-5 text-success" >Respecto al registro de su cuenta</h1>
        <h2 class="text-dark"> Le informamos que...
    <%  
        String email = request.getParameter("email");
        String pass = request.getParameter("password");
        long cuitCust = Long.parseLong(request.getParameter("cuit"));
        String namesAll = request.getParameter("namesAll");
        long celularCust = Long.parseLong(request.getParameter("celular"));
        SendMail mailPre = new SendMail();
        
        CustomerDAO CustomerDB = new CustomerDAO();
        boolean exists = CustomerDB.validation(cuitCust);
        
        if (!exists) {
            //out.println("pasa por si false");
            String subject = "Registro recbido...";
            String body = "Hola, "+namesAll +". Ante todo recibe un cordial saludo, y de nuestra parte\n"
                + "el agradecimiento por la confianza en nuestro sistema. Para concluir los tramites para la empresa cuyo cuit es\n"
                +"el siguiente "+cuitCust+ " debemos confirmar su cuenta de correo.\n "
                + "Agradecemos que confirme que ha realizado este registro haciendo clic en el link anexo.\n"
                + "(Insertar link)\n"
                + "Sin otro particular a que hacer referencia, agradeciendo el habernos elegido.\n"
                + "Nos despedimos, atentamente";
            
//            String resultado = CustomerDB.createCustomer(cuitCust, email, namesAll, celularCust, pass);
//            out.println(resultado);
            
            String send = mailPre.goSendMail(email,subject,body);
            out.println(send);
    %>  
        Falta confirmar el correo.
        Revise su cuenta de correo para continuar.</h2>
        <a href="../" class="text-primary">Salir</a>
    <%
        } else {

            out.println("pasa por sino true");
    %>
        <h1 class="m-5 text-danger" >Ya existe una cuenta para ese cliente, el registro no se ha realizado</h1>
        <p>Debe dirigirse al ingreso de usuario y recuperar su clave si no la recuerda</p>
        <a href="../" class="text-primary">Salir</a>
    <%
            }
    %> 
    </body>
</html>
