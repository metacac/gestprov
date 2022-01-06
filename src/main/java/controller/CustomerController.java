/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import database.CustomerDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Customer;
import model.SendMail;

/**
 *
 * @author gerencia
 */
@WebServlet(name = "CustomerController", urlPatterns = {"/Customer/*"})
public class CustomerController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     * @throws java.sql.SQLException
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            
            String action = request.getPathInfo();
            CustomerDAO CustomerDB = new CustomerDAO();
            HttpSession session = request.getSession();
            SendMail mailPre = new SendMail();
            
            
//            session.setAttribute("islogin", false);
//            session.setAttribute("isMessLogout", false);
//            session.setAttribute("isMessBlocked", false);
//            session.setAttribute("isMessRejected", false);
//            session.setAttribute("isMessRegistered", false);
//            session.setAttribute("isMessNoRegistered", false);
//            session.setAttribute("isMessRecovered", false);
//            session.setAttribute("isMessNoRecovered", false);
            
            String resultado = "";
                    
            switch (action) {

                case "/access":
                    String email = request.getParameter("email");
                    String pass = request.getParameter("password");
                    boolean login =  CustomerDB.login(email,pass) && CustomerDB.validateStatusByEmail(email);
                    
                    if (login) {
                        Customer customer = CustomerDB.getCustomerByEmail(email);
                        session.setAttribute("customer", customer);
                        session.setAttribute("isLogin", true);
                        session.setAttribute("isStart", false);
                        response.sendRedirect("/actioncustomer/access.jsp");
                    } else {
                        int count = (int) session.getAttribute("attempts");
                        if (count<2) {
                            count += 1;
                            session.setAttribute("attempts", count);
                            session.setAttribute("isMessRejected", true);
                            response.sendRedirect("/Views/login");
                        } else {
                            Customer customer = CustomerDB.getCustomerByEmail(email);
                            String cuit = customer.getCuitCus();
                            CustomerDB.locked(cuit);
                            session.setAttribute("isMesslocked", true);
                            response.sendRedirect("/Views/login");
                        }
                    }
                    break;
                    
                case "/register":
                    email = request.getParameter("email");
                    pass = request.getParameter("password");
                    String rePass = request.getParameter("passwordRepetido");
                    String namesRepre = request.getParameter("namesRepre");
                    String celular = request.getParameter("celular");
                    String cuit = request.getParameter("cuit");
                    
                    boolean repeated = CustomerDB.repeated(pass, rePass);
                    boolean duplicate = CustomerDB.duplicateCuit(cuit);
                    
                    if (!repeated) {
                        session.setAttribute("isMessNoRepeteadPass", true);
                        response.sendRedirect("/Views/registration");
                        break;
                    }
                    
                    if (!duplicate) {
                        Timestamp dateCre = CustomerDB.createCustomer(cuit, email, namesRepre, celular, pass);
                        
                        String subject = "Registro realizado...";
                        String body = "Hola, "+namesRepre +". Ante todo recibe un cordial saludo, y de nuestra parte\n"
                        + "el agradecimiento por la confianza en nuestro sistema de gestion de proveedores.\n\n"
                        + "Para concluir los tramites para la empresa cuyo cuit es\n"
                        + "el siguiente "+cuit+ " realizados en la fecha "+ dateCre+".\n\n"
                        + "Por favor confirma la cuenta de correo electrónico, para ello\n "
                        + "agradecemos hacer clic en el siguiente link (Insertar link)\n\n"
                        + "Sin otro particular a que hacer referencia, sintiendos honrados de habernos elegido.\n"
                        + "Nos despedimos, atentamente";

                        String send = mailPre.goSendMail(email,subject,body);

                        session.setAttribute("validation", duplicate);
                        session.setAttribute("resultado", send); 
                        session.setAttribute("isMessRegistered", true);
                        response.sendRedirect("/Views/registration");
                        } else {
                        session.setAttribute("validation", duplicate);
                        session.setAttribute("resultado", "No enviado");
                        session.setAttribute("isMessNoRegistered", true);
                        response.sendRedirect("/Views/registration");
                        }
                    
                    break;
                    
                case "/recover":
                    email = request.getParameter("email");
                    cuit = request.getParameter("cuit");
                    
                    boolean validate = CustomerDB.validate(cuit, email);
                    
                    if (validate) {
                        long datetime = System.currentTimeMillis();
                        Timestamp timestamp = new Timestamp(datetime);
                        Customer customer = CustomerDB.getCustomerByEmail(email);
                        
                        String subject = "Registro validado...";
                        String body = "Hola, "+customer.getNamesRepre() +". Ante todo recibe un cordial saludo.\n"
                        + "Damos, nuevamente, la bienvenida a nuestro sistema a usted y a la\n"
                        + "empresa cuyo cuit es "+cuit+ " cuya representación ejerce."
                        + "Si usted no ha realizado este procedimiento, ignore este correo.\n\n"
                        + "El procedimiento de recuperación de la cuenta fue\n"
                        + "realizado en la fecha siquiente "+ timestamp+".\n"
                        + "Para continuar, haga clic en el siguiente link (Insertar link).\n\n "
                        + "Sin otro particular a que hacer referencia, sintiendos honrados de continuar con nosotros.\n"
                        + "Nos despedimos, atentamente";

                        String send = mailPre.goSendMail(email,subject,body);
                        
                        session.setAttribute("validation", validate);
                        session.setAttribute("result", send);
                        session.setAttribute("isMessRecovered", true);
                        response.sendRedirect("/Views/recovery");
                        } else {
                        session.setAttribute("validation", validate);
                        session.setAttribute("result", "No enviado");
                        session.setAttribute("isMessNoRecovered", true);
                        response.sendRedirect("/Views/recovery");
                        }
                    
                    break;
                    
                case "/logout":
                    session.setAttribute("islogin",false);
                    session.setAttribute("isStart", true);
                    session.setAttribute("isMesgLogout", true);
                    session.invalidate();
                    response.sendRedirect("../index.jsp");
                    break;
                    
                case "/404":
                    //response.sendRedirect("/views/registration.jsp");
                    break;
                
                case "/500":
                    //response.sendRedirect("/views/registration.jsp");
                    break;
                default:
                    break;
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(CustomerController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(CustomerController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
