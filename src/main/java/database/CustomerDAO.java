/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package database;

import config.DBConn;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.Customer;

/**
 *
 * @author gerencia
 */
public class CustomerDAO {
    
    Connection connec;
    PreparedStatement ps;
    ResultSet rs;
    
    
    public CustomerDAO() {
        DBConn conn = new DBConn();
        connec = conn.getConnection("gestprov", "", ""); //configurar usuario y clave segun el caso
    }
    
    public Customer getCustomer(int id) throws SQLException{
        Customer customer = null;
        
        ps = connec.prepareStatement("SELECT * FROM customer WHERE id = ?");
        ps.setInt(1,id);
        rs = ps.executeQuery();
        
        if (rs.next()) {
            long cuit = rs.getInt("cuit");
            String email = rs.getString("email");
            String namesAll = rs.getString("namesAll");
            long celular = rs.getInt("celular");
            String password = rs.getString("password");
            
            customer = new Customer(cuit, email, namesAll, celular, password);
        }
        return customer;
        
    }
    
    public boolean login(String email, String password) throws SQLException {
        
        ps = connec.prepareStatement("SELECT email, password FROM customer WHERE email = ? AND password = ?");
        ps.setString(1, email);
        ps.setString(2, password);
        rs = ps.executeQuery();
        
        return rs.next();
    }
    
    public boolean validation(long cuit) throws SQLException {
        
        ps = connec.prepareStatement("SELECT cuit FROM customer WHERE cuit = ?");
        ps.setLong(1, cuit);
        rs = ps.executeQuery();
        
//        if (rs.next()) {
//            cuit = rs.getInt("cuit");
//        }
        return rs.next();
    }
    
    public String createCustomer(long cuit, String email, String namesAll, long celular, String password) throws SQLException{
        String resultado = "El registro ha sido creado..."; 
        
        ps = connec.prepareStatement("INSERT INTO customer (cuit, email, namesAll, celular, password) VALUES (?,?,?,?,?)");
        ps.setLong(1,cuit);
        ps.setString(2, email);
        ps.setString(3, namesAll);
        ps.setLong(4,celular);
        ps.setString(5, password);
        rs = ps.executeQuery();
        
        return resultado;
    }
    
    public String updateCustomer(long cuit, String email, String namesAll, long celular, String password) throws SQLException{
        String resultado = "El registro ha sido creado"; 
        
        ps = connec.prepareStatement("UPDATE customer (cuit, email, namesAll, celular, password) VALUES (?,?,?,?,?)");
        ps.setLong(1,cuit);
        ps.setString(2, email);
        ps.setString(3, namesAll);
        ps.setLong(4,celular);
        ps.setString(2, password);
        rs = ps.executeQuery();
        
        return resultado;
    }
}