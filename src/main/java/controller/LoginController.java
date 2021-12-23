/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import database.AccountDAO;
import database.CustomerDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Customer;
import model.Information;
import model.Invoices;

/**
 *
 * @author gerencia
 */
@WebServlet(name = "LoginController", urlPatterns = {"/Login/*"})
public class LoginController extends HttpServlet {

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
            
            switch (action) {
                case "/zone":
                    HttpSession session = request.getSession();
//                    AccountDAO AccountDB = new AccountDAO();
//                    
//                    session.getAttribute("isLogin", true);
//                    
//                    String email = (String) session.getAttribute("email");
//                    Customer customer = (Customer) session.getAttribute("customer");
//                    Information information = AccountDB.getInformationByEmail(email);
//                    long cuit = customer.getCuit();
//                    Invoices invoces = AccountDB.getInvoiceByCuit(cuit);
//                    session.setAttribute("infor", information);
//                    session.setAttribute("invoce", invoces);
                    response.sendRedirect("/login/zone.jsp");
                    break;
                
                case "/contacts":
                    response.sendRedirect("/login/contactsLogin.jsp");
                    break;
                    
                case "/generate":
                    response.sendRedirect("/login/generate.jsp");
                    break;
                    
                case "/custInfor":
                    response.sendRedirect("/login/custInformation.jsp");
                    break;

                case "/inforEdit":
                    response.sendRedirect("/login/informationEdit.jsp");
                    break;
                
                case "/custInforEdit":
                    AccountDAO AccountDB = new AccountDAO();
                    long cuit = Long.parseLong(request.getParameter("cuit"));
                    long phone = Long.parseLong(request.getParameter("phone"));
                    String direction = request.getParameter("direction"); 
                    String postalCode = request.getParameter("postalCode");
                    String city = request.getParameter("city");
                    String country = request.getParameter("country");
                    String typeCust = request.getParameter("typeCust");
                    
                    String  resultado = AccountDB.updateCustomer(cuit, phone, direction, postalCode, city, country, typeCust);
                    response.sendRedirect("/login/zone.jsp");
                    break;
                    
                case "/update":
                    
                    break;
                case "/delete":
                    
                    break;
                case "/logout":
                        response.sendRedirect("/Customer/logout");
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
            Logger.getLogger(LoginController.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(LoginController.class.getName()).log(Level.SEVERE, null, ex);
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
