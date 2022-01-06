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
import static java.sql.Statement.RETURN_GENERATED_KEYS;
import java.sql.Timestamp;
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
        connec = conn.getConnection("xxxxxxx", "xxxx", "xxxxxx"); //configurar usuario y clave segun el caso
    }
    
    public Customer getCustomerByEmail(String email) throws SQLException{
        Customer customer = null;
        
        ps = connec.prepareStatement("SELECT * FROM customer WHERE email = ?");
        ps.setString(1,email);
        rs = ps.executeQuery();
        
        while (rs.next()) {            
            customer = new Customer(rs.getString("cuitCus"), email, rs.getString("namesRepre"), rs.getString("celular"));
        }
        
        rs.close();
        ps.close();
        //connec.close();
        return customer;
    }
    
    public boolean validateStatusByEmail(String email) throws SQLException {
        Boolean respuesta = false;
        String sql = "SELECT statusCustomer FROM information "
                   + "LEFT JOIN customer "
                   + "ON  cuitInf = cuitCus "
                   + "WHERE email = ?";
        ps = connec.prepareStatement(sql);
        ps.setString(1, email);
        rs = ps.executeQuery();
        
        if (rs.next()) {
            respuesta = rs.getString("statusCustomer").equals("Activo");
            rs.close();
            ps.close();
            //connec.close();
            return respuesta;
        }
        rs.close();
        ps.close();
        //connec.close();
        return respuesta;
    }
    
    public boolean login(String email, String password) throws SQLException {
        String sql = "SELECT email, password FROM customer WHERE email=? AND password = ?";
        ps = connec.prepareStatement(sql);
        ps.setString(1, email);
        ps.setString(2, password);
        rs = ps.executeQuery();
        
        if (rs.next()){
            rs.close();
            ps.close();
            //connec.close();
            return true;
        }
        rs.close();
        ps.close();
        //connec.close();
        return false;
    }
        
    public boolean duplicateCuit(String cuit) throws SQLException {
        String sql = "SELECT cuitCus FROM customer WHERE cuitCus = ?";
        ps = connec.prepareStatement(sql);
        ps.setString(1, cuit);
        rs = ps.executeQuery();
        
         if (rs.next()){
            rs.close();
            ps.close();
            //connec.close();
            return true;
        }
        rs.close();
        ps.close();
        //connec.close();
        return false;
    }
    
    public boolean validate(String cuit, String email) throws SQLException {
        String sql = "SELECT cuitCus, email FROM customer WHERE cuitCus = ? AND email = ?";
        ps = connec.prepareStatement(sql);
        ps.setString(1, cuit);
        ps.setString(2,email);
        rs = ps.executeQuery();
        
         if (rs.next()){
            rs.close();
            ps.close();
            //connec.close();
            return true;
        }
        rs.close();
        ps.close();
        //connec.close();
        return false;
    }
    
    public Timestamp createCustomer(String cuit, String email, String namesRepre, String celular, String password) throws SQLException{
        Long datetime = System.currentTimeMillis();
        Timestamp dateCre = new Timestamp(datetime); 
        String sql = "INSERT INTO customer (cuitCus, email, namesRepre, celular, password) VALUES (?,?,?,?,?)";
        ps = connec.prepareStatement(sql, RETURN_GENERATED_KEYS);
        ps.setString(1,cuit);
        ps.setString(2, email);
        ps.setString(3, namesRepre);
        ps.setString(4,celular);
        ps.setString(5, password);
        ps.executeUpdate();
        
        rs = ps.getGeneratedKeys();
        while (rs.next()) {
            //dateCre = rs.getTimestamp(1);
        }
        rs.close();
        ps.close();
        //connec.close();
        return dateCre;
    }
    
    public String locked(String cuit) throws SQLException {
        String sql = "UPDATE information SET statusCustomer = 'Bloqueado'"
                   + "WHERE cuitCus = ?"; 
        ps = connec.prepareStatement(sql);
        ps.setString(1, cuit);
        ps.executeUpdate();
        
        rs.close();
        ps.close();
        //connec.close();
        return "Usuario bloqueado";
    }
    
    public Boolean repeated(String password, String passwordRepetido) {
        if (password.equals(passwordRepetido)) {
            return true;
        } else {
            return false;
        }
    }
}